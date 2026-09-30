import 'package:flutter/material.dart';

/// 確定カラーパレット(docs/design/svg-assets/README.md参照、2026-09-29確定)。
class AppColors {
  AppColors._();

  /// コーラル。プライマリボタン等。
  static const primary = Color(0xFFF87965);

  /// 黄。セカンダリボタン・選択中チップ等。
  static const secondary = Color(0xFFF6CA65);

  /// クリーム。画面背景。
  static const background = Color(0xFFFFF3D5);

  /// 紙。カード等の面(背景よりも白く、浮き上がって見える)。
  static const surface = Color(0xFFFFFCF6);

  /// ココア。見出し・本文。
  static const textPrimary = Color(0xFF654536);
  static const textSecondary = Color(0xFF8C7568);

  /// 葉。安心・成功系のアクセント。
  static const accentLeaf = Color(0xFF95B78B);

  /// 淡い桃。共感・ハート系のアクセント。
  static const accentPink = Color(0xFFFAD7CB);

  static const divider = Color(0xFFEFE2C8);
}
