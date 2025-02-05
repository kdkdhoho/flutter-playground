import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 앱의 현재 Theme를 가져옵니다.
    final style = theme.textTheme.displaySmall!.copyWith(
      // theme.textTheme을 통해 앱의 글꼴 테마(TextTheme)를 가져옵니다. TextTheme 클래스에는 다양한 필드가 존재합니다.
      color: theme.colorScheme
          .onPrimary, // primary는 앱의 아이덴티티 색상인 반면, onPrimary는 primary 색상 위에서 UI 요소를 표시할 때 나타낼 색상입니다. primary 색상과 대비되는 색상으로, 가시성을 높입니다.
    );

    return Card(
      color: theme.colorScheme.primary,
      // 앱에서 현재 테마의 색상 구성표(color scheme)에 정의된 '기본 색상'을 가져옵니다.
      elevation: 10,
      // Card의 음영을 나타냅니다.
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "${pair.first} ${pair.second}",
          style: style,
          semanticsLabel:
              "${pair.first} ${pair.second}", // semanticsLabel을 통해 스크린 리더에서 발음이 이상하게 나오는 문제를 해결합니다.
        ),
      ),
    );
  }
}
