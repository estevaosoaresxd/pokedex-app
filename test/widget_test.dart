// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "package:pokedex_app/main.dart";

void main() {
  testWidgets("Counter increments smoke test", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that our counter starts at 0.
    expect(find.text("0"), findsOneWidget);
    expect(find.text("1"), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text("0"), findsNothing);
    expect(find.text("1"), findsOneWidget);
  });

  List<int> calcFibonnaci({int total = 5}) {
    final List<int> fibonnaciValues = [];

    int n1 = 0, n2 = 1, nextNum;

    for (int i = 1; i <= total; ++i) {
      nextNum = n1 + n2;
      n1 = n2;
      n2 = nextNum;

      fibonnaciValues.add(n1);
    }

    return fibonnaciValues;
  }

  test(
      "Fibonnaci Validator - unit test correspondente que garanta que a 2ª posição seja igual à 3ª posição e que a 4ª posição seja igual a 3ª",
      () {
    final values = calcFibonnaci();

    expect(values[1], equals(values[2]));
    expect(values[3], equals(values[2]));
  });
}
