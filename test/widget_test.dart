import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kosodate_hitoiki/app.dart';

void main() {
  testWidgets('ボトムナビゲーションの5タブが表示される', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));

    final navBar = find.byType(NavigationBar);
    expect(navBar, findsOneWidget);

    for (final label in ['ホーム', '検索', '書く', 'お知らせ', 'マイページ']) {
      expect(
        find.descendant(of: navBar, matching: find.text(label)),
        findsOneWidget,
      );
    }
  });
}
