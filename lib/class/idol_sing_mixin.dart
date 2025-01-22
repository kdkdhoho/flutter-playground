import 'idol.dart';

/// Mixin
/// - 생성자가 없는 클래스
/// - 보통 다른 클래스에 프로퍼티를 추가할 때 사용한다.
mixin IdolSingMixin on Idol {
  void sing() {
    print("$name이 노래를 부릅니다.");
  }
}
