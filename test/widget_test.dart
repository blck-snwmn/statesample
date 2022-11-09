// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statesample/main.dart';

void main() {
  testGoldens('sample_golden_test', (WidgetTester tester) async {
    await loadAppFonts();
    //デバイスの画面サイズ(iPhone6)
    const size6 = Size(375, 667);

    await tester.pumpWidgetBuilder(const ProviderScope(child: MyApp()),
        surfaceSize: size6);
    await screenMatchesGolden(tester, 'sample_iphone6');
  });
}
