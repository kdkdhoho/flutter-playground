Dart(혹은 Flutter)에서 단위 테스트를 하기 위해 필요한 라이브러리가 있습니다.<br>
이를 설치하기 위해선 아래 명령어를 입력합니다.

- with Dart
  - `dart pub add dev:test`
- with Flutter
  - `flutter pub add dev:test`

---

명령어 실행 결과, pubspec.yaml에 아래 코드가 추가됩니다.
```yaml
dev_dependencies:
  test: ^1.25.14
```

---

이제 `import 'package:test/test.dart';` 코드를 통해 필요한 메서드를 사용할 수 있습니다.

