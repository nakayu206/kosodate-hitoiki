import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabaseクライアントの初期化。値は`.env`(gitignore対象)から読み込む。
/// 開発時は`.env.example`をコピーして`.env`を作成すること。
/// バックエンド(スキーマ・RLS・Edge Functions)は kosodate-hitoiki-backend で管理する。
class SupabaseConfig {
  SupabaseConfig._();

  static Future<void> initialize() async {
    await dotenv.load();

    await Supabase.initialize(
      url: dotenv.get('SUPABASE_URL'),
      // publishableKeyへの移行は、supabase_flutter側で正式に使えるようになってから対応する。
      // ignore: deprecated_member_use
      anonKey: dotenv.get('SUPABASE_ANON_KEY'),
    );
  }
}
