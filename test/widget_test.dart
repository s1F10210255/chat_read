import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test app UI', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp()); // MyApp() は main() 内で定義されているウィジェットです

    // 画像が3つ表示されていることを確認
    expect(find.byType(Image), findsNWidgets(3));

    // "+" アイコンをタップしてカウンターが増加するかをテスト
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // カウンターが1になることを確認
    expect(find.text('1'), findsOneWidget);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // アプリのウィジェットツリーを構築
    final img = Image.asset('images/img01.jpg');

    final row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [img, img, img],
    );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: row,
        ),
      ),
    );
  }
}
