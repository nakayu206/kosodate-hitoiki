import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/compose/compose_page.dart';
import '../pages/home/home_page.dart';
import '../pages/mypage/mypage_page.dart';
import '../pages/notifications/notifications_page.dart';
import '../pages/search/search_page.dart';

/// 画面下部タブ(ホーム/検索/書く/お知らせ/マイページ)の選択状態。
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

/// 5タブ構成のナビゲーションシェル(docs/全体設計書.md 4.1参照)。
class MainNavigationShell extends ConsumerWidget {
  const MainNavigationShell({super.key});

  static const _pages = [
    HomePage(),
    SearchPage(),
    ComposePage(),
    NotificationsPage(),
    MyPagePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) =>
            ref.read(bottomNavIndexProvider.notifier).state = index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'ホーム'),
          NavigationDestination(icon: Icon(Icons.search), label: '検索'),
          NavigationDestination(icon: Icon(Icons.edit_outlined), label: '書く'),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            label: 'お知らせ',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'マイページ',
          ),
        ],
      ),
    );
  }
}
