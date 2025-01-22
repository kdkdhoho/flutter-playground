/**
 * 제네릭을 사용할 수 있습니다.
 * 아래는 제네릭을 이용한 캐시 객체의 예시입니다.
 */
class Cache<T> {
  final T data;

  Cache(this.data);
}
