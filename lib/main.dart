import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './src/speak_easy.dart';

late Size mq;

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(SpeakEasy());
}
