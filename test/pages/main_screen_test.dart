import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/pages/weather.dart';

void main() {
  testWidgets('Main screen widget has an app bar with a title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MainScreen()));
    expect(find.text('Мой день'), findsOneWidget);
  });

  testWidgets('Main screen should have avatar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MainScreen()));
    expect(find.byType(CircleAvatar), findsOneWidget);
  });

  testWidgets('Main screen should have buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MainScreen()));
    expect(find.text('Задачи'), findsOneWidget);
    expect(find.text('Погода'), findsOneWidget);
  });

  testWidgets('Route from the home screen to tasks page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MainScreen()));
    await tester.press(find.text('Задачи'));
    await tester.pumpAndSettle();
    expect(find.text('Задачи'), findsOneWidget);
  });

  testWidgets('Route from the home screen to weather page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MainScreen()));
    await tester.press(find.text('Погода'));
    await tester.pumpAndSettle();
    expect(find.text('Погода'), findsOneWidget);
  });
}