import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kosodate_hitoiki/app.dart';

void main() {
  testWidgets('アプリ起動時にはじめての案内(S-01)が表示される', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));

    expect(find.text('登録してはじめる'), findsOneWidget);
    expect(find.text('登録せずに読む'), findsOneWidget);
    expect(find.text('ログイン'), findsOneWidget);
  });
}
