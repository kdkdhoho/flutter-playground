import 'boy_group.dart';

void main() {
  var bts = BoyGroup("BTS", 7);

  // 캐스케이드 연산자입니다.
  bts
    ..sayName()
    ..sayMale();
}
