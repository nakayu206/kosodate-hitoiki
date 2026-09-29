import 'package:flutter/material.dart';

/// S-07 マイページ。実装はIssue #12を参照。
class MyPagePage extends StatelessWidget {
  const MyPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: const Center(child: Text('マイページ(未実装)')),
    );
  }
}
