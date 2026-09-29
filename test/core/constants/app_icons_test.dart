import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kosodate_hitoiki/core/constants/app_icons.dart';

void main() {
  testWidgets('各カテゴリのSVGアセットが読み込める', (tester) async {
    const paths = [
      AppIcons.navHome,
      AppDecorations.sunSmiling,
      AppIllustrations.welcome,
      AppAvatars.defaultSprout,
      AppReactions.empathy,
    ];

    for (final path in paths) {
      await tester.pumpWidget(MaterialApp(home: SvgPicture.asset(path)));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull, reason: '$path の読み込みに失敗');
    }
  });
}
