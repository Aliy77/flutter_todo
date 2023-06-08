import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/pages/weather.dart';

void main() {
  testWidgets('Weather widget has an app bar with a title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Weather()));
    expect(find.text('Погода'), findsOneWidget);
  });
  testWidgets('Weather widget has a back button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Weather()));
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
  testWidgets('Weather widget displays weather data', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Weather()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(Text), findsNWidgets(2));
  }); 
  testWidgets ('Weather widget navigates back to home screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Weather()));
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.byType(IconButton), findsOneWidget);
  });
}