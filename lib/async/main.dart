// void main() async {
//   var result = await addNumbers(1, 1);
//   print('결과: $result\n');
//
//   result = await addNumbers(2, 2);
//   print('결과: $result');
// }

/**
    만약 addNumbers(1, 1);과 addNumbers(2, 2); 가 순차적으로 실행되길 바란다면 아래처럼 작성합니다.

    void main() async {
    await addNumbers(1, 1);
    await addNumbers(2, 2);
    }
 */

/**
 * 비동기 요청을 보낼 수 있는 방법들입니다.
 * Future.delayed() 메서드를 사용하여 비동기 요청을 보낼 수 있습니다.
 * async와 await 키워드를 통해
 */
// 1. Future.delayed()
// void addNumbers(int number1, int number2) {
//   print('$number1 + $number2 계산 시작!');
//
//   // Future.delayed()는, 입력한 Duration만큼 대기했다가, callback 함수를 실행합니다.
//   Future.delayed(Duration(seconds: 3), () {
//     print('$number1 + $number2 = ${number1 + number2}');
//   });
//
//   print('$number1 + $number2 계산 끝!');
// }

// 2. async와 await
// Future<int> addNumbers(int number1, int number2) async { // 함수에 async 키워드를 지정합니다.
//   print('$number1 + $number2 계산 시작!');
//
//   // 대기하고 싶은 비동기 함수 앞에다가 await를 작성합니다.
//   await Future.delayed(Duration(seconds: 3), () {
//     print('$number1 + $number2 = ${number1 + number2}');
//   });
//
//   print('$number1 + $number2 계산 끝!');
// }

// 2-2. Future.delayed()를 통해 결과값을 반환 받을 수도 있습니다.
// void main() async {
//   var result = await addNumbers(1, 1);
//   print('결과: $result\n');
//
//   result = await addNumbers(2, 2);
//   print('결과: $result');
// }
//
// Future<int> addNumbers(int number1, int number2) {
//   print('$number1 + $number2 계산 시작!');
//
//   return Future.delayed(Duration(), () {
//     final result = number1 + number2;
//     print('$number1 + $number2 계산 종료!');
//
//     return result;
//   });
// }

// 2-3. Future은 일회성입니다. Stream을 사용하면 지속적으로 값을 받아올 수 있습니다.

// 2-3-1. Stream 기본 사용법입니다.
// import 'dart:async';
//
// void main() {
//   // final controller = StreamController();
//   // final stream = controller.stream;
//   // final streamListener = stream.listen((value) {
//   //   print(value);
//   // });
//
//   // 간결하게 작성할 수 있습니다.
//   final streamController = StreamController();
//   streamController.stream.listen((value) {
//     print(value);
//   });
//
//   // Stream에 값을 주입합니다.
//   streamController.sink.add(1);
//   streamController.sink.add(2);
//   streamController.sink.add(3);
// }

// 2-3-2. BroadcastStream
// Stream의 listen은 한 번만 실행할 수 있습니다. 하지만 BroadCast Stream을 사용하면 listen()을 여러 번 할 수 있습니다.
// void main() {
//   final streamController = StreamController();
//   final broadcastStream = streamController.stream.asBroadcastStream();
//
//   // 첫 번째 listen() 입니다.
//   broadcastStream.listen((val) {
//     print('listening 1');
//     print(val);
//   });
//
//   broadcastStream.listen((val) {
//     print('listening 2');
//     print(val);
//   });
//
//   broadcastStream.listen((val) {
//     print('listening 3');
//     print(val);
//   });
//
//   // add()를 실행할 때마다, listen()하는 모든 콜백 함수에 값이 전달됩니다.
//   // streamController.sink.add(1);만 실행했을 때와 모든 코드를 실행했을 때를 비교하면 확인할 수 있습니다.
//   streamController.sink.add(1);
//   streamController.sink.add(2);
//   streamController.sink.add(3);
// }

// 2-3-3. 함수로 스트림 반환하기
// StreamController를 직접 사용하지 않아도 Stream을 반환하는 함수를 선언할 수도 있습니다.
// void main() {
//   // calculate() 함수에 인자로 1을 건네주며 listen() 합니다. -> Stream을 "구독"하여, 구독 중에 반환된 값을 콜백 함수에서 처리합니다.
//   // calculate() 함수의 결과인 result를 출력합니다.
//   calculate(1).listen((result) {
//     print(result);
//   });
//
//   // 만약, calculate(1) 만 호출되고 listen()이 호출되지 않을 때에는 generator 함수는 Stream을 반환한 채로 함수의 실행을 일시 중지합니다.
//   // 이후 listen()을 통해 구독을 시작하게 되면, generator 함수는 실행 정보가 저장된 상태에서 실행을 재개합니다.
//   // generator 함수는 yield를 만나게 되면 값을 반환하고 다시 실행을 일시 중지합니다.
//   // 이후, 소비자가 새로운 값을 요청하게 되면 일시 중지된 지점부터 작업을 재개합니다.
//   // Stream과 yield는 이벤트 기반으로 동작하게 됩니다.
//   // 현재 예시 코드의 경우에는 calculate(1).listen()을 통해 generator 함수에 Stream을 연결하게 되면, generator 함수가 종료될 때까지 값을 요청하고, 그 응답을 콜백 함수에 사용하는 것입니다.
// }
//
// // Stream을 반환하기 위해선 async* 를 추가합니다.
// // async*는 비동기 generator 함수를 선언하며, Stream을 반환하고 값을 비동기적으로 생성합니다.
// Stream<String> calculate(int number) async* {
//   for (var i = 0; i < 5; i++) {
//
//     yield 'i = $i'; // yield 키워드로 실행 결과를 반환하고 함수 진행을 일시 중지합니다.
//     // yield는 generator 함수에서 값을 하나씩 생산하는 데 사용되는 키워드입니다. 단순히 값을 반환하는 것이 아니라, 함수를 일시 중단하고, 이수 함수 호출을 재개할 수 있도록 합니다.
//     // 따라서, 'i = $i' 가 "생산"된 이후, 함수 진행은 멈추게 되고, 소비자가 값을 요청하게 되면 그 다음 작업인 `await Future.delayed(Duration(seconds: 1));`를 호출하게 되어 1초간 대기 후, for문을 이어서 진행하게 됩니다.
//
//     await Future.delayed(Duration(seconds: 1));
//   }
// }

// 함수로 스트림 반환하기 번외편 (Dart 공식 문서 예제 코드)
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;

  // Stream을 구독하는 또 다른 방법으로, await for가 있습니다.
  await for (final value in stream) {
    sum += value;
  }

  /**
   * await for을 listen을 사용하여 Stream을 구독하기 위해서는 아래와 같이 작성해야 합니다.
   *
   *   await stream.listen((result) {
   *     sum += result;
   *   }).asFuture();
   *
   *   단순히 listen()만을 호출하면, Stream을 비동기적으로 호출한 이후 바로 다음 코드가 수행됩니다. 따라서 0이 반환되게 됩니다.
   *   따라서 listen을 사용하면서 값을 대기하기 위해서는, await를 추가한 Future로 바꾸어 비동기 호출의 결과를 기다려야 합니다.
   *
   *   아래 코드는 원하는 결과가 나오지 않습니다.
   *   stream.listen((result) {
   *     sum += result;
   *   });
   *
   *   await for과 listen()은 Stream을 구독하는 방식에서 주요한 차이가 있습니다.
   *   스트림이 종료될 때까지 대기하는 방식에서 차이가 있습니다. await for은 자동으로 Stream이 종료될 때까지 대기하지만, listen은 종료를 명시적으로 선언해줘야 합니다. (asFuture() 사용)
   *   블로킹 유무에도 차이가 있습니다. await for은 데이터가 처리될 때까지 기다리며 블로킹되지만, listen은 비동기적으로 실행하며 블로킹되지 않습니다.
   *   구독을 취소하는 방식에도 차이가 있습니다. await for은 구독을 취소하거나 제어할 수 없지만, listen은 StreamSubscription을 통해 취소 및 제어가 가능합니다.
   *   예외를 처리하는 방식에도 차이가 있습니다. await for은 try-catch를 통해 처리하지만, listen은 onError 콜백 함수를 통해 처리됩니다.
   */

  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

void main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // 55
}
