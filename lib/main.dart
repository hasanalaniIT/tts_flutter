import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: TextToSpeech(),
        ),
      ),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  TextToSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: textEditingController,
            ),
            ElevatedButton(
                onPressed: () => speak(textEditingController.text),
                child: const Text("Speak"))
          ],
        ),
      ),
    );
  }

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.2);
    await flutterTts.setSpeechRate(0.55);
    // List language = List<String>.from(await flutterTts.getLanguages);
    // print(language);
    await flutterTts.speak(text);
  }
}
