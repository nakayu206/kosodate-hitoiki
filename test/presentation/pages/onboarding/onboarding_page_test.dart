import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kosodate_hitoiki/presentation/pages/onboarding/onboarding_page.dart';

void main() {
  Widget wrap(Widget child) => ProviderScope(child: MaterialApp(home: child));

  testWidgets('「登録せずに読む」を押すとホーム画面(ボトムナビ)に遷移する', (tester) async {
    await tester.pumpWidget(wrap(const OnboardingPage()));

    await tester.tap(find.text('登録せずに読む'));
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('「登録・ログイン」を押すと登録・ログイン画面に遷移する', (tester) async {
    await tester.pumpWidget(wrap(const OnboardingPage()));

    await tester.tap(find.text('登録・ログイン'));
    await tester.pumpAndSettle();

    expect(find.text('メール/Google/Appleログイン(未実装)'), findsOneWidget);
  });
}
