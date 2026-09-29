import 'package:flutter/material.dart';

import '../../../core/constants/app_spacing.dart';
import '../auth/login_page.dart';
import '../../widgets/main_navigation_shell.dart';

/// S-01 はじめての案内。アプリの説明と利用ルールの要点を伝える(ログイン不要)。
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'ひと息(仮)',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              const Text(
                '子育てでしんどさを感じたときにぐちをこぼし、\n'
                'コメントで共感・コツ・体験談を共有できる場所です。',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.lg),
              const _RulesSummary(),
              const Spacer(),
              FilledButton(
                onPressed: () => _goToHome(context),
                child: const Text('登録せずに読む'),
              ),
              const SizedBox(height: AppSpacing.sm),
              OutlinedButton(
                onPressed: () => _goToLogin(context),
                child: const Text('登録・ログイン'),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }
}

/// 利用ルールの要点(docs/全体設計書.md 5章の決定事項に基づく)。
class _RulesSummary extends StatelessWidget {
  const _RulesSummary();

  static const _rules = [
    '誰かを傷つける言葉は送信前にチェックされます',
    '名前・学校や園・住んでいる場所などは書かないでください',
    'つらい気持ちを吐き出すことは制限されません',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final rule in _rules)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle_outline, size: 18),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: Text(rule)),
              ],
            ),
          ),
      ],
    );
  }
}
