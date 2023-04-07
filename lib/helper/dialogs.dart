import 'package:flutter/material.dart';
import '../const.dart';

class Dialogs {
  static void showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: kprimaryColor),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: kredColor.withOpacity(0.7),
      elevation: 5,
      shape: StadiumBorder(),
    ));
  }

  static void showProgressbar(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );
  }
}
