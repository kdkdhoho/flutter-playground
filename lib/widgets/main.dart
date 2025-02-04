import 'dart:ui';

import 'package:flutter/material.dart';

/**
 * 'Everything is Widget'은 구글이 플러터를 소개할 때의 문구입니다.
 *
 * 위젯은 자식을 하나만 가지는 위젯과 여럿을 가지는 위젯으로 나뉩니다.
 *
 * 자식을 하나만 가지는 대표적인 위젯은 다음과 같으며 대체로 child 매개변수를 입력받습니다.
 * - Container: 자식을 담는 컨테이너 역할을 합니다. 단순히 자식을 담는 것이 아닌 배경색, 너비와 높이, 테두리 등의 디자인을 지정할 수 있습니다.
 * - GestureDetector: 플러터가 제공하는 제스처 기능을 자식 위젯에서 인식하도록 합니다. 탭, 드래그, 더블 클릭 같은 제스처 기능이 자식 위젯에 인식하고 그에 따른 동작을 하도록 합니다.
 * - SizedBox: 높이와 너비를 지정하는 위젯입니다. Container와 달리 디자인적인 요소는 지정할 수 없습니다. const 생성자로 선언할 수 있어 성능 면에서 더 효율적입니다.
 *
 * 다수의 자식을 입력할 수 있는 위젯은 children 매개변수를 입력받으며 리스트로 여러 위젯을 입력할 수 있습니다. 대표적인 위젯은 아래와 같습니다.
 * - Column: 입력된 모든 위젯을 세로로 배치합니다.
 * - Row: 입력된 모든 위젯을 가로로 배치합니다.
 * - ListView: 리스트를 구현할 때 사용합니다. 입력된 위젯들이 화면을 벗어나게 되면 스크롤이 가능해집니다.
 *
 * 모든 위젯은 child와 children을 동시에 입력받지 않습니다.
 */
void main() {
  // runApp(MyApp());
  // runApp(FloatingActionButtonExample());
  // runApp(MyDesignWidgetExample());
  // runApp(RowWidgetExample());
  // runApp(ColumnWidgetExample());
  // runApp(FlexibleWidgetExample());
  // runApp(ExpandWidgetExample());
  runApp(StackWidgetExample());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: GestureDetector(
                  // 텍스트를 작성할 수 있는 위젯입니다.
                  /*child: Text(
                        'Hello World!',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.green
                        )
                    )*/

                  // 텍스트만 있는 버튼입니다.
                  /*  child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.red),
                        child: Text('텍스트 버튼')
                    )*/

                  // 테두리가 있는 버튼입니다.
                  /*child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red
                      ),
                      child: Text('Outlined Button')
                  )*/

                  // 입체적으로 튀어나온 느낌의 배경이 들어간 버튼입니다.
                  /*child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent
                      ),
                      child: Text('Elevated Button')
                  )*/

                  // 아이콘을 버튼으로 생성하는 위젯입니다.
                  /*child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        // 더 다양한 아이콘은 https://fonts.google.com/icons 에서 확인할 수 있습니다.
                        Icons.home
                      )
                  )*/

                  /*child: GestureDetector(
                    onTap: () {
                      print('on Tap!');
                    },
                    onDoubleTap: () {
                      print('on Double Tap!');
                    },
                    onLongPress: () {
                      print('on Long Press!');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red
                      ),
                      width: 100,
                      height: 100
                    )
                  )*/
                )
            )
        )
    );
  }
}

class FloatingActionButtonExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Text('클릭'),
            ),
            body: Container()
        )
    );
  }
}

class MyDesignWidgetExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
              // 컨테이너 위젯입니다. 말그대로 다른 위젯을 담는 데 사용합니다. 위젯의 크기를 지정하거나 배경이나 테두리를 추가할 때 많이 사용합니다.
              /*child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 16.0,
                color: Colors.green
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: 100.0,
            height: 200.0
          )*/

              // SizedBox는 특정 크기의 공간을 공백으로 두고 싶을 때 사용합니다.
              // Container 위젯을 사용해도 되지만, const 생성자를 사용했을 때 성능 면에서 이점을 얻을 수 있습니다.
              /*child: SizedBox(
              width: 200,
              height: 200,
              child: Container(
                  color: Colors.green
              )
          )*/

              // Padding 위젯을 사용하면 Padding 위젯의 상위 위젯과 하위 위젯 사이의 여백을 둘 수 있습니다.
              /*child: Container(
            color: Colors.blue,
            child: Padding(
                padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.red,
                width: 50,
                height: 50
              )
            )
          )*/

              // Container 위젯에는 `margin` 속성을 통해, 위젯의 외부와 일정 간격을 둡니다.
              /*child: Container(
            color: Colors.black,
            margin: EdgeInsets.all(30)
          )*/

              // 현대의 핸드폰은 크기와 디자인이 모두 다릅니다.
              // 플러터는 가용되는 화면을 모두 사용하는데, 애플의 노치 디자인의 경우 위젯을 가릴 수 있습니다.
              // 그럴 때 SafeArea 위젯을 이용해 안전한 화면에서만 위젯을 그릴 수 있습니다.
              /*child: SafeArea(
            top: true,
            child: Container(
              color: Colors.black,
              width: 250,
              height: 250
            )
          )*/
            )
        )
    );
  }
}

/**
 * Row와 Column은 위젯들을 가로와 세로로 배치하는 데 사용됩니다.
 * 두 위젯 모두 children을 매개변수로 입력받습니다.
 * Row와 Column에는 주축(main axis)과 반대축(cross axis)이라는 개념이 존재합니다.
 * Row는 가로가 주축, 세로가 반대축, Column은 세로가 주축, 가로가 반대축이 됩니다.
 * 주축과 반대축을 어떻게 조합하냐에 따라 Row와 Column 위젯을 이용해서 다양하게 배치할 수 있습니다.
 *
 * 아래 예시 코드에서 중요한 것은, mainAxisAlignment와 crossAxisAlignment의 속성을 입력함에 따라 결과가 어떻게 달라지는 지 확인하는 것 입니다.
 */
class RowWidgetExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SizedBox(
              height: double.infinity, // 반대축에서 이동할 공간을 제공하기 위해 높이를 최대한으로 설정합니다.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 주축 정렬을 지정합니다. 기본적으로 제공되는 다양한 종류가 있으며, 입력되는 기준에 따라 Row 내부에 있는 위젯들이 자동으로 배치됩니다.
                crossAxisAlignment: CrossAxisAlignment.stretch, // 반대축 정렬을 지정합니다.
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red
                  ),
                  const SizedBox(), // SizedBox는 일반적으로 공백을 생성할 때 사용합니다.
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green
                  ),
                  const SizedBox(),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue
                  )
                ]
              )
            )
        )
    );
  }
}

class ColumnWidgetExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red
              ),
              const SizedBox(),
              Container(
                width: 50,
                height: 50,
                color: Colors.green
              ),
              const SizedBox(),
              Container(
                width: 50,
                height: 50,
                color: Colors.blue
              )
            ]
          )
        )
      )
    );
  }
}

/**
 * Flexible 위젯은 Row나 Column에 사용합니다.
 * 사용하면, Flexible에 제공된 child 위젯의 크기를 최소한으로 차지하게 됩니다.
 * 추가적으로 flex 매개변수를 통해 각 Flexible 위젯이 얼만큼의 비율로 차지하게 할 것인지도 결정할 수 있습니다.
 */
class FlexibleWidgetExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.blue
              )
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.red
              )
            )
          ],
        )
      )
    );
  }
}

/**
 * Expanded 위젯은 Flexible 위젯을 상속받는 위젯으로, Column과 Row에서 Expanded 위젯을 사용하면 위젯이 남아 있는 공간을 최대한으로 차지합니다.
 * 원리는 이렇습니다. Flexible 위젯의 매개변수 중, fit 매개변수가 있습니다.
 * fit 매개변수에는 FlexFit.tight과 FlexFit.loose 를 입력할 수 있는데, FlexFit.loose를 입력하면 자식 위젯이 필요한 만큼만 공간을 차지합니다.
 * 하지만 FlexFit.tight는 자식 위젯이 차지하는 공간과 관계없이 남은 공간을 모두 차지합니다. Expanded 위젯은 바로 이 Flexble 위젯의 fix 매개변수에 FlexFit.tight를 기본으로 설정한 위젯입니다.
 */
class ExpandWidgetExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
                  color: Colors.blue
                )
            ),
            Expanded(
                child: Container(
                    color: Colors.red
                )
            )
          ],
        )
      )
    );
  }
}

/**
 * @Deprecated
 * Stack 위젯은, 자식 위젯들을 겹치도록 해줍니다.
 * 플러터의 그래픽 엔진인 스키아 엔진은 2D 엔진이기 때문에 겹친 '두께'를 표현하지는 못하는 한계가 존재합니다.
 * 위젯의 순서는 children에 입력한 위젯들 순서대로 화면에 그려집니다. 즉, 제일 위에 입력될수록 화면에서는 제일 아래에 존재하게 됩니다.
 *
 * + 2025.02.04 - 내용 수정)
 * Flutter 3.10 부터 기존 Skia 엔진을 Impeller 엔진으로 대체합니다.
 */
class StackWidgetExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.red
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.green
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue
            )
          ],
        )
      )
    );
  }
}
