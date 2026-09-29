import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/config/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await SupabaseConfig.initialize();
  } catch (error) {
    runApp(_StartupErrorApp(error: error));
    return;
  }

  runApp(const ProviderScope(child: App()));
}

/// Supabase初期化に失敗した場合の最小限のエラー画面。
/// (`.env`未作成・接続先未設定などが原因になりうる)
class _StartupErrorApp extends StatelessWidget {
  const _StartupErrorApp({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('アプリの起動に失敗しました。\n$error'),
          ),
        ),
      ),
    );
  }
}
