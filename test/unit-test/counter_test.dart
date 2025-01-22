import 'package:flutter_playground/unit-test/counter.dart';
import 'package:test/test.dart';

void main() {
  group("증가하고 감소하면 카운터의 값은 0이다.", () {
    print(1);

    // given
    final counter = Counter();

    test('initial value is 0', () {
      // when
      final result = counter.value;

      // then
      expect(result, 0);
    });

    test(("증가하면 1이 된다."), () {
      // when
      counter.increment();

      // then
      expect(counter.value, 1);
    });

    test('decrease then value is 0', () {
      // when
      counter.decrement();

      // then
      expect(counter.value, 0);
    });
  });

  group("똑같이 수행해도 동일하다", () {
    // given
    final counter = Counter();

    test("초기 값은 0이다.", () {
    });

    test("감소하면 -1이다.", () {
      counter.decrement();

      // then
      expect(counter.value, -1);
    });

    test("다시 증가하면 1이다.", () {
      // when
      counter.increment();

      // then
      expect(counter.value, 0);
    });
  });
}
