
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  // コンストラクターにFlutterTtsの設定を記述
  Home({super.key}) {
    tts.setLanguage('ja-JP'); // 読み上げる言語を日本語に設定
    tts.setSpeechRate(1); // 読み上げる速度を設定
  }

  // FlutterTtsのインスタンスを作成
  final FlutterTts tts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    // 入力したテキストを取得するためのコントローラー
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Text('入力すると音声を読みあげます', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '入力してください',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        // ボタンを押したときに入力したテキストを読み上げる
                        tts.speak(controller.text);
                      },
                      child: const Text('入力')),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        // 音声の呼び上げを停止する
                        tts.stop();
                      },
                      child: const Text('停止')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}