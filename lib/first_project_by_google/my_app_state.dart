import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

/**
 * 앱이 실행되는 동안 상태를 정의합니다.
 * Flutter에는 앱 상태를 관리하는 방법이 여러 가지가 있지만, 가장 이해하기 쉬운 ChangeNotifier를 사용합니다.
 *
 * MyAppState는 앱이 작동하는 데 필요한 데이터를 정의합니다.
 * ChangeNotifier 클래스를 상속받고 있으며 해당 클래스는 자체 변경사항에 대해 다른 항목에 알릴 수 있습니다.
 */
class MyAppState extends ChangeNotifier {

  var current = WordPair.random();
  var likes = <WordPair>[];

  /**
   * 클래스 내부에 사용자 메서드를 생성했습니다.
   * 상태값을 변경했으며, MyAppState를 보고 있는 다른 위젯에게 알림을 보내는 `notifyListeners()` 메서드를 호출했습니다.
   * 참고로 이 메서드는 ChangeNotifier 클래스의 메서드입니다.
   */
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleLike() {
    if (likes.contains(current)) {
      likes.remove(current);
    } else {
      likes.add(current);
    }
    notifyListeners();
  }
}
