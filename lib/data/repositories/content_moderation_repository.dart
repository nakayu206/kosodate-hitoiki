import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/moderation_result.dart';

/// 誹謗中傷・個人情報の送信前チェック(必須要件、docs/全体設計書.md 5章)。
///
/// 対象: 投稿本文・自由コメント・返信・ニックネーム・自己紹介。
/// 判定処理自体(禁止語リスト+AI判定)はバックエンド(kosodate-hitoiki-backend)の
/// Edge Function側で行う。関数名・レスポンス形式はバックエンド実装と合わせて確定する
/// (現時点では { verdict, reason?, supportMessageRequired? } を想定)。
class ContentModerationRepository {
  ContentModerationRepository(this._client);

  final SupabaseClient _client;

  static const _functionName = 'check-content';

  Future<ModerationResult> check(String text) async {
    final response = await _client.functions.invoke(
      _functionName,
      body: {'text': text},
    );

    return ModerationResult.fromJson(response.data as Map<String, dynamic>);
  }
}
