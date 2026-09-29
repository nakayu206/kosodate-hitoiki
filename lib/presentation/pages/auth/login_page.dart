import 'package:flutter/material.dart';

/// S-10 登録・ログイン。実装はIssue #15を参照。
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登録・ログイン')),
      body: const Center(child: Text('メール/Google/Appleログイン(未実装)')),
    );
  }
}
