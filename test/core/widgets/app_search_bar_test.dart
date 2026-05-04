import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_gym_tracker/core/widgets/app_search_bar.dart';

void main() {
  testWidgets('AppSearchBar shows/hides clear button based on text', (tester) async {
    String changedValue = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppSearchBar(
            hintText: 'Search...',
            onChanged: (val) => changedValue = val,
          ),
        ),
      ),
    );

    // Initially no clear button
    expect(find.byIcon(Icons.close_rounded), findsNothing);

    // Type something
    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.pump();

    // Clear button should appear
    expect(find.byIcon(Icons.close_rounded), findsOneWidget);

    // Tap clear button
    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pump();

    // Text should be empty and clear button gone
    expect(find.text('Hello'), findsNothing);
    expect(find.byIcon(Icons.close_rounded), findsNothing);
    expect(changedValue, '');
  });

  testWidgets('AppSearchBar triggers onChanged when typing', (tester) async {
    String changedValue = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppSearchBar(
            hintText: 'Search...',
            onChanged: (val) => changedValue = val,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Test');
    expect(changedValue, 'Test');
  });

  testWidgets('AppSearchBar supports boxed style', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppSearchBar(
            hintText: 'Search...',
            onChanged: (_) {},
            style: AppSearchBarStyle.boxed,
          ),
        ),
      ),
    );

    // Verify boxed style decoration (Container with specific color)
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, const Color(0xFF18181B));
    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('AppSearchBar supports underlined style', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppSearchBar(
            hintText: 'Search...',
            onChanged: (_) {},
            style: AppSearchBarStyle.underlined,
          ),
        ),
      ),
    );

    // Verify underlined style (no search icon prefix by default in my implementation)
    expect(find.byIcon(Icons.search), findsNothing);
    
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.decoration?.border, isA<UnderlineInputBorder>());
  });
}
