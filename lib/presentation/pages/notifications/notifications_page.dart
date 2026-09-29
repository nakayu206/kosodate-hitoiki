import 'package:flutter/material.dart';

/// S-06 お知らせ。実装はIssue #11を参照。
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('お知らせ')),
      body: const Center(child: Text('お知らせ一覧(未実装)')),
    );
  }
}
