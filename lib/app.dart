import 'package:flutter/material.dart';

import 'core/constants/app_theme.dart';
import 'presentation/pages/onboarding/onboarding_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ひと息(仮)',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const OnboardingPage(),
    );
  }
}
