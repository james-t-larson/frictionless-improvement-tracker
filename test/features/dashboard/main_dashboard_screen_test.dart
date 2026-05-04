import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_gym_tracker/features/dashboard/views/main_dashboard_screen.dart';
import 'package:simple_gym_tracker/features/dashboard/viewmodels/dashboard_bloc.dart';
import 'package:simple_gym_tracker/features/dashboard/viewmodels/data_management_bloc.dart';
import 'package:simple_gym_tracker/data/models/workout_log.dart';
import 'package:simple_gym_tracker/data/repositories/movement_repository.dart';

class MockDashboardBloc extends Mock implements DashboardBloc {}
class MockDataManagementBloc extends Mock implements DataManagementBloc {}
class MockMovementRepository extends Mock implements MovementRepository {}

void main() {
  late MockDashboardBloc mockDashboardBloc;
  late MockDataManagementBloc mockDataManagementBloc;
  late MockMovementRepository mockMovementRepository;

  setUpAll(() {
    registerFallbackValue(const SearchDashboardLogs(''));
  });

  setUp(() {
    mockDashboardBloc = MockDashboardBloc();
    mockDataManagementBloc = MockDataManagementBloc();
    mockMovementRepository = MockMovementRepository();

    final getIt = GetIt.instance;
    if (getIt.isRegistered<DataManagementBloc>()) {
      getIt.unregister<DataManagementBloc>();
    }
    if (getIt.isRegistered<MovementRepository>()) {
      getIt.unregister<MovementRepository>();
    }
    getIt.registerSingleton<DataManagementBloc>(mockDataManagementBloc);
    getIt.registerSingleton<MovementRepository>(mockMovementRepository);

    when(() => mockDashboardBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockDashboardBloc.state).thenReturn(DashboardLoaded(const {}, const [], query: ''));
    
    when(() => mockDataManagementBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockDataManagementBloc.state).thenReturn(DataOperationInitial());
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<DashboardBloc>.value(
        value: mockDashboardBloc,
        child: const MainDashboardScreen(),
      ),
    );
  }

  testWidgets('Buttons take up available horizontal width on mobile when logs exist', (tester) async {
    when(() => mockDashboardBloc.state).thenReturn(DashboardLoaded(const {}, [
      WorkoutLog(id: 1, movementId: 1, weight: 100, reps: 10, timestamp: 123, painFelt: false, variations: [], movementName: 'Bench Press')
    ], query: ''));

    const screenWidth = 400.0;
    tester.view.physicalSize = Size(screenWidth, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final newLiftBtn = find.text('NEW LIFT');
    expect(newLiftBtn, findsOneWidget);

    final btnFinder = find.ancestor(of: newLiftBtn, matching: find.byWidgetPredicate((w) => w is ButtonStyleButton));
    expect(btnFinder, findsOneWidget);
    
    final btnSize = tester.getSize(btnFinder);
    // When logs exist, both ADD SET and NEW LIFT are shown, so they share the width.
    // (400 - 32 padding - 12 gap) / 2 = 178
    expect(btnSize.width, (screenWidth - 32 - 12) / 2);
    
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  });

  testWidgets('Buttons are positioned at the bottom of the screen when logs exist', (tester) async {
    when(() => mockDashboardBloc.state).thenReturn(DashboardLoaded(const {}, [
      WorkoutLog(id: 1, movementId: 1, weight: 100, reps: 10, timestamp: 123, painFelt: false, variations: [], movementName: 'Bench Press')
    ], query: ''));

    const screenHeight = 800.0;
    tester.view.physicalSize = Size(400, screenHeight);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final newLiftBtn = find.text('NEW LIFT');
    expect(newLiftBtn, findsOneWidget);

    final btnFinder = find.ancestor(of: newLiftBtn, matching: find.byWidgetPredicate((w) => w is ButtonStyleButton));
    expect(btnFinder, findsOneWidget);

    final btnCenter = tester.getCenter(btnFinder);
    expect(btnCenter.dy, greaterThan(screenHeight * 0.8));
    
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  });

  testWidgets('New Lift button is centered when no logs are present', (tester) async {
    when(() => mockDashboardBloc.state).thenReturn(DashboardLoaded(const {}, const [], query: ''));

    const screenHeight = 800.0;
    const screenWidth = 400.0;
    tester.view.physicalSize = Size(screenWidth, screenHeight);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final newLiftBtn = find.text('NEW LIFT');
    expect(newLiftBtn, findsOneWidget);

    final btnFinder = find.ancestor(of: newLiftBtn, matching: find.byWidgetPredicate((w) => w is ButtonStyleButton));
    expect(btnFinder, findsOneWidget);

    final btnCenter = tester.getCenter(btnFinder);
    // Should be roughly in the middle of the screen
    expect(btnCenter.dy, closeTo(screenHeight / 2, 100));
    expect(btnCenter.dx, closeTo(screenWidth / 2, 10));
    
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  });

  testWidgets('Search bar triggers search and clear events', (tester) async {
    // Provide a state with logs so the search bar is visible
    when(() => mockDashboardBloc.state).thenReturn(
      DashboardLoaded(const {}, [
        WorkoutLog(id: 1, movementId: 1, weight: 100, reps: 10, timestamp: 123, painFelt: false, variations: [], movementName: 'Bench Press')
      ], query: '')
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final searchField = find.byType(TextField);
    expect(searchField, findsOneWidget);

    // Type in search field
    await tester.enterText(searchField, 'Bench');
    await tester.pump();

    verify(() => mockDashboardBloc.add(const SearchDashboardLogs('Bench'))).called(1);

    // Clear button should be visible
    final clearBtn = find.byIcon(Icons.close_rounded);
    expect(clearBtn, findsOneWidget);

    // Tap clear button
    await tester.tap(clearBtn);
    await tester.pump();

    verify(() => mockDashboardBloc.add(const SearchDashboardLogs(''))).called(1);
    expect(find.text('Bench'), findsNothing);
  });

  testWidgets('Search bar is hidden when no logs are present', (tester) async {
    when(() => mockDashboardBloc.state).thenReturn(DashboardLoaded(const {}, const [], query: ''));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsNothing);
  });
}
