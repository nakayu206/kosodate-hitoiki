import 'package:flutter/material.dart';

/// S-02 ホーム(投稿一覧)。実装はIssue #7を参照。
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ホーム')),
      body: const Center(child: Text('投稿一覧(未実装)')),
    );
  }
}
