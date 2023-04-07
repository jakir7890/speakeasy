import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speakeasy/api/api.dart';
import 'package:speakeasy/screens/auth/login/login_screen.dart';
import 'package:speakeasy/screens/home/home_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      if (APIs.auth.currentUser != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GoogleLogin(),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Spacer(),
          Image.asset(
            'images/icon.png',
            width: mq.width * 0.5,
          ),
          Spacer(),
          Text(
            'Made In Bangladesh 🇧🇩',
            style: TextStyle(fontSize: mq.width * 0.045),
          ),
          Spacer(),
        ],
      )),
    );
  }
}
