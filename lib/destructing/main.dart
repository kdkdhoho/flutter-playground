/**
 * Destructing은 객체와 패턴이 일치하면, 객체의 데이터에 액세스하여 부분적으로 추출할 수 있는 문법입니다.
 * 패턴에 대한 자세한 내용은 https://dart.dev/language/patterns 에서 확인할 수 있습니다.
 */

/**
 * 기본적인 사용 형태입니다.
 */
/*void main() {
  final nums1 = [1, 2, 3];
  final [a, b, c] = nums1; // destructing 발생
  print(a + b + c); // 6
}*/

/**
 * 스프레드 연산자를 이용한 형태입니다.
 * 스프레드 연산자를 통해 중간 값을 버릴 수 있습니다.
 */
/*void main() {
  final nums2 = [1,2,3,4,5,6,7,8,9];
  final [x, y, ..., z] = nums2;
  print(x + y + z); // 12
}*/

/**
 * Map 타입의 데이터 또한 destructing이 가능합니다.
 */
/*void main() {
  final userInfo = {'name': 'kdkdhoho', 'age': 27};
  final {'name': myName, 'age': myAge} = userInfo;
  print('My name is $myName and my age is $myAge'); // My name is kdkdhoho and my age is 27

  *//**
     * 순서가 바뀌어도 상관없습니다.
     *//*
  final {'age': myAge2, 'name': myName2} = userInfo;
  print('My name is $myName2 and my age is $myAge2'); // My name is kdkdhoho and my age is 27

  *//**
            * 일부 Entry만 destructing이 가능합니다.
            *//*
  final {'age': myAge3} = userInfo;
  print('My age is $myAge3'); // My age is 27
}*/

/**
 * 객체도 destructing이 가능합니다.
 */
import 'package:flutter_playground/destructing/user.dart';

void main() {
  final user = User(name: 'kdkdhoho', age: 27);
  final User(name: userName, age: userAge) = user; // 클래스의 생성자 구조와 동일하게 destructing 하면 됩니다.
  print('$userName, $userAge'); // kdkdhoho, 27

  final User(age: userAge2, name: userName2) = user; // 순서는 상관없습니다.
  print('$userName2, $userAge2'); // kdkdhoho, 27

  final User(age: userAge3) = user; // 일부 필드만 destructing 가능합니다.
  print('$userAge3'); // 27
}
