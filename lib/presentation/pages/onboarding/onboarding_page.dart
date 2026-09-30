import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_spacing.dart';
import '../../widgets/main_navigation_shell.dart';
import '../auth/login_page.dart';

/// S-01 はじめての案内(docs/design/S-01_はじめての案内.png)。
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void _goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainNavigationShell()),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.sm),
              const _Header(),
              const SizedBox(height: AppSpacing.md),
              Text(
                '言いづらいことも、\nここでひと息。',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '子育ての気持ちを、\n安心して書ける場所です。',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.lg),
              const _RulesCard(),
              const SizedBox(height: AppSpacing.lg),
              _Footer(
                onLogin: () => _goToLogin(context),
                onSkip: () => _goToHome(context),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}

/// 「ひと息」ワードマークと太陽マスコット(固定高さのヘッダー帯)。
class _Header extends StatelessWidget {
  const _Header();

  static const _height = 168.0;
  static const _sunSize = 150.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 12,
            left: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ひと息',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset(
                  AppDecorations.leavesSprout,
                  width: 22,
                  height: 22,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: -12,
            child: SizedBox(
              width: _sunSize,
              height: _sunSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppDecorations.cloudSoft,
                    width: _sunSize,
                    height: _sunSize,
                  ),
                  SvgPicture.asset(
                    AppDecorations.sunSmiling,
                    width: _sunSize * 0.72,
                    height: _sunSize * 0.72,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 利用ルールの要点(docs/全体設計書.md 5章の決定事項に基づく)。
class _RulesCard extends StatelessWidget {
  const _RulesCard();

  static const _rules = [
    (
      AppDecorations.leavesSprout,
      Color(0xFFE3F0DE),
      '名前や個人情報は書かない',
      '安心して気持ちを話せるように、\n個人が特定される情報は書かないでください。',
    ),
    (
      AppDecorations.heartWarm,
      Color(0xFFFBE3DD),
      '気持ちを否定しない',
      'どんな気持ちも、否定せずに\n受けとめ合いましょう。',
    ),
    (
      AppDecorations.sunSmiling,
      Color(0xFFFCEFC7),
      '自分のペースで大丈夫',
      '見るだけでも、書くのは後でも。\nあなたのペースで使えます。',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          for (final (icon, badgeColor, title, description) in _rules)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: badgeColor,
                    child: SvgPicture.asset(icon, width: 26, height: 26),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// ボタン群と、四隅ににじみ出す葉っぱの装飾(スクロール内容に追従させるためbuttons群に紐づける)。
class _Footer extends StatelessWidget {
  const _Footer({required this.onLogin, required this.onSkip});

  final VoidCallback onLogin;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -28,
          bottom: -16,
          child: Opacity(
            opacity: 0.9,
            child: SvgPicture.asset(
              AppDecorations.leavesSprout,
              width: 76,
              height: 76,
            ),
          ),
        ),
        Positioned(
          right: -20,
          bottom: -20,
          child: Opacity(
            opacity: 0.9,
            child: SvgPicture.asset(
              AppDecorations.leavesSprout,
              width: 84,
              height: 84,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(56),
                textStyle: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              onPressed: onLogin,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('登録してはじめる'),
                  SizedBox(width: 4),
                  Icon(Icons.chevron_right, size: 20),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.textPrimary,
                minimumSize: const Size.fromHeight(56),
                textStyle: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              onPressed: onSkip,
              child: const Text('登録せずに読む'),
            ),
            const SizedBox(height: AppSpacing.lg),
            Center(
              child: TextButton(
                onPressed: onLogin,
                child: Text(
                  'ログイン',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
