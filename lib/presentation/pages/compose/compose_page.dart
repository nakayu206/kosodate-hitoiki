import 'package:flutter/material.dart';

/// S-04 書く(投稿作成・編集)。実装はIssue #9を参照。
class ComposePage extends StatelessWidget {
  const ComposePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('書く')),
      body: const Center(child: Text('投稿作成(未実装)')),
    );
  }
}
