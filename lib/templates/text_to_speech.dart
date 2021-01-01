import 'package:flutter/src/widgets/page_view.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech{

  static final TextToSpeech _instance = TextToSpeech._internal();

  FlutterTts flutterTts = FlutterTts();
  String data;
  factory TextToSpeech(){
    return _instance;
  }
  TextToSpeech._internal()  {
    setInitial();
  }

  setInitial() async {
    await flutterTts.getLanguages;
    await flutterTts.setLanguage("es-US");
    await flutterTts.setSpeechRate(0.5);
  }
   void speak() async {
    await flutterTts.speak(data);
    flutterTts.setCompletionHandler(() async {
      await flutterTts.stop();
    });
  }


  void stop() async {
    await flutterTts.stop();
  }

  void setData(String data){
    this.data = data;
  }


}