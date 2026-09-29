import 'package:flutter/material.dart';

/// S-05 検索。実装はIssue #10を参照。
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('検索')),
      body: const Center(child: Text('キーワード検索(未実装)')),
    );
  }
}
