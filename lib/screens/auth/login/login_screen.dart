import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speakeasy/api/api.dart';
import 'package:speakeasy/const.dart';
import 'package:speakeasy/helper/dialogs.dart';

import '../../home/home_screen.dart';
import '../../../main.dart';
import 'dart:developer';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  bool _isAnimate = false;

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });

    super.initState();
  }

  _handleButtonClick() {
    Dialogs.showProgressbar(context);
    _signInWithGoogle().then((user) {
      Navigator.pop(context);
      if (user != null) {
        log('\nUser: ${user.user}');
        log('\nadditionalUserInfo: ${user.additionalUserInfo}');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\nsignInWithGoogle: $e');
      Dialogs.showSnackbar(context, 'Something went wrong Cehck you Internet!');
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellcome to Speak Easy'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: mq.height * 0.15,
            width: mq.width * 0.5,
            right: _isAnimate ? mq.width * 0.25 : -mq.width * 0.5,
            duration: Duration(seconds: 1),
            child: Image.asset(
              'images/icon.png',
            ),
          ),
          Positioned(
            bottom: mq.height * 0.15,
            width: mq.width * 0.9,
            left: mq.width * 0.05,
            height: mq.height * 0.07,
            child: ElevatedButton.icon(
              onPressed: _handleButtonClick,
              icon: Image.asset(
                'images/google.png',
                width: mq.width * .07,
              ),
              label: RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'Signin with ', style: TextStyle(fontSize: 18)),
                TextSpan(
                    text: 'Google,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
              ])),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), backgroundColor: kprimaryColor),
            ),
          )
        ],
      ),
    );
  }
}
