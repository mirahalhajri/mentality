import 'package:flutter/material.dart';
import 'package:peaapp/module/sensitive/sensitiveMain.dart';

class SocialQuestion extends StatelessWidget {
  const SocialQuestion(this.questionText, {Key key}) : super(key: key);

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
