import 'idol.dart';
import 'idol_sing_mixin.dart';

class BoyGroup extends Idol with IdolSingMixin {
  BoyGroup(super.name, super.memberCount);

  void sayMale() {
    print("저는 남자 아이돌입니다.");
  }

  @override
  void sayName() {
    print("우리는 남자 아이돌 $name 입니다.");
  }

  @override
  void sing() {
    print("남자 아이돌이 노래를 부른다 !!!!");
  }
}
