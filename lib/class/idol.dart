const int defaultMemberCount = 10;

abstract class Idol {
  final String _name; // 변수명 앞의 _ 은, Java의 접근 제어자 private 과 동일합니다.
  final int _memberCount;

  Idol(this._name, this._memberCount); // 기본 형태의 생성자입니다.

  // 네임드 생성자를 사용한 1번 예시입니다.
  Idol.withoutMemberCount(this._name)
      : _memberCount = defaultMemberCount;

  // 네임드 생성자를 사용한 2번 예시입니다.
  Idol.create()
      : _name = 'BTS',
        _memberCount = defaultMemberCount;

  void sayName(); // 추상 메서드

  int get memberCount => _memberCount;

  String get name => _name;
}
