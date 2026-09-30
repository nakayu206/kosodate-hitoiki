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
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ひと息',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SvgPicture.asset(
                    AppDecorations.sunSmiling,
                    width: 64,
                    height: 64,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                '言いづらいことも、\nここでひと息。',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '子育ての気持ちを、\n安心して書ける場所です。',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
              ),
              const SizedBox(height: AppSpacing.lg),
              const _RulesCard(),
              const SizedBox(height: AppSpacing.lg),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                onPressed: () => _goToLogin(context),
                child: const Text('登録してはじめる'),
              ),
              const SizedBox(height: AppSpacing.sm),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: AppColors.textPrimary,
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                onPressed: () => _goToHome(context),
                child: const Text('登録せずに読む'),
              ),
              const SizedBox(height: AppSpacing.sm),
              Center(
                child: TextButton(
                  onPressed: () => _goToLogin(context),
                  child: Text(
                    'ログイン',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
      '安心して気持ちを話せるように、個人が特定される情報は書かないでください。',
    ),
    (
      AppDecorations.heartWarm,
      Color(0xFFFBE3DD),
      '気持ちを否定しない',
      'どんな気持ちも、否定せずに受けとめ合いましょう。',
    ),
    (
      AppDecorations.sunSmiling,
      Color(0xFFFCEFC7),
      '自分のペースで大丈夫',
      '見るだけでも、書くのは後でも。あなたのペースで使えます。',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
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
                    radius: 22,
                    backgroundColor: badgeColor,
                    child: SvgPicture.asset(icon, width: 24, height: 24),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          description,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                          ),
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
