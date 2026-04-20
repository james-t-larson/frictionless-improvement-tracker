import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_gym_tracker/features/dashboard/views/main_dashboard_screen.dart';
import 'package:simple_gym_tracker/features/dashboard/viewmodels/dashboard_bloc.dart';
import 'package:simple_gym_tracker/data/models/workout_log.dart';
import 'package:simple_gym_tracker/core/di/service_locator.dart';
import 'package:get_it/get_it.dart';

class MockDashboardBloc extends Mock implements DashboardBloc {}

void main() {
  late MockDashboardBloc mockDashboardBloc;

  setUp(() {
    mockDashboardBloc = MockDashboardBloc();
    // We need to register a dummy service locator for the test if the screen uses it
    // Or we can mock the specific repositories it uses
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<DashboardBloc>.value(
        value: mockDashboardBloc,
        child: const MainDashboardScreen(),
      ),
    );
  }

  testWidgets('Buttons take up available horizontal width on mobile', (tester) async {
    const screenWidth = 400.0;
    tester.view.physicalSize = Size(screenWidth, 800);
    tester.view.devicePixelRatio = 1.0;

    when(() => mockDashboardBloc.state).thenReturn(DashboardLoaded({}, [], query: ''));
    
    await tester.pumpWidget(createWidgetUnderTest());

    final newLiftBtn = find.text('NEW LIFT');
    expect(newLiftBtn, findsOneWidget);

    final btnSize = tester.getSize(find.ancestor(of: newLiftBtn, matching: find.byType(ElevatedButton)));
    
    // Width should be screenWidth minus padding (16*2 = 32)
    expect(btnSize.width, screenWidth - 32);
    
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  });

  testWidgets('Buttons are positioned at the bottom of the screen', (tester) async {
    const screenHeight = 800.0;
    tester.view.physicalSize = Size(400, screenHeight);
    tester.view.devicePixelRatio = 1.0;

    when(() => mockDashboardBloc.state).thenReturn(DashboardLoaded({}, [], query: ''));
    
    await tester.pumpWidget(createWidgetUnderTest());

    final newLiftBtn = find.text('NEW LIFT');
    final btnCenter = tester.getCenter(find.ancestor(of: newLiftBtn, matching: find.byType(ElevatedButton)));
    
    // Button should be in the bottom half of the screen
    expect(btnCenter.dy, greaterThan(screenHeight * 0.8));
    
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  });
}
