import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabaseクライアントの初期化。
///
/// [_anonKey]は「匿名キー」であり、クライアントアプリに同梱される前提の公開情報
/// (秘匿すべきAPIキーではない)。実際のアクセス制御はSupabase側のRLS(行単位の権限)
/// で行う(docs/全体設計書.md 7章)。サービスロールキー等の本当に秘匿すべき値は
/// クライアントアプリには一切含めず、kosodate-hitoiki-backend側でのみ扱う。
///
/// 値は仮のプレースホルダー。kosodate-hitoiki-backendでSupabaseプロジェクトを
/// 作成した後、実際のURL・匿名キーに差し替える。
class SupabaseConfig {
  SupabaseConfig._();

  static const _url = 'https://your-project.supabase.co';
  static const _anonKey = 'your-anon-key';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: _url,
      // publishableKeyへの移行は、supabase_flutter側で正式に使えるようになってから対応する。
      // ignore: deprecated_member_use
      anonKey: _anonKey,
    );
  }
}
