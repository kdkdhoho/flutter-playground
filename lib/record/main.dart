/**
 * 레코드는 Dart 3.0 이상부터 사용할 수 있는 타입입니다.
 * 포지셔널 파라미터 또는, 네임드 파라미터 중 한 가지 방식을 적용해 사용할 수 있습니다. 두 방식을 혼용할 수도 있습니다.
 * 레코드에 정의할 수 있는 값의 개수는 제한이 없습니다.
 */

// 1. 포지셔널 파라미터를 이용한 레코드
// void main() {
//   (String, int) user = ("kdkdhoho", 27);
//   print(user); // (kdkdhoho, 27)
//
//   // 레코드의 특정한 순서의 값만을 가져올 수도 있습니다.
//   print(user.$1); // kdkdhoho
//   print(user.$2); // 27
// }

// 2. 네임드 파라미터를 이용한 레코드
// 네임드 파라미터를 이용하기 위해선, 소괄호 안에 "중괄호"를 넣으면 됩니다.
void main() {
  ({String name, int age}) user = (age: 27, name: 'kdkdhoho');
  print(user); // (age: 27, name: kdkdhoho)

  ({String name, int age}) user2 = (name: 'kdkdhoho', age: 27);
  print(user2); // (age: 27, name: kdkdhoho)
  // print(user2.$1); // 네임드 파라미터를 사용한 경우에는 인덱싱이 불가합니다.
  print(user2.age); // 27
  print(user2.name); // kdkdhoho

  // 포지셔널 파라미터와 네임드 파라미터를 혼용해서 사용할 수 있습니다.
  (String address, {String name, int age}) user3 = ("천안", name: 'kdkdhoho', age: 27);
  // ({String name, int age}, String address) user3 = ("천안", name: 'kdkdhoho', age: 27); // 두 방식을 혼용하려면 포지셔널 파라미터가 앞으로 와야 합니다. 그렇지 않으면 컴파일 에러가 발생합니다.
  print(user3); // (천안, age: 27, name: kdkdhoho)
  print(user3.$1); // 천안
  // print(user3.$2); // 네임드 파라미터는 순서로 인덱싱이 불가합니다.
  print(user3.age); // 27
  print(user3.name); // kdkdhoho
}
