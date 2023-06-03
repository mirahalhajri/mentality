import 'package:flutter/material.dart';

class SocialAnswer extends StatelessWidget {
  const SocialAnswer(this.x, this.answerText, {Key key}) : super(key: key);

  final String answerText;
  final Function() x;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: MaterialButton(
          color: Color(0xfffed4d5),
          onPressed: x,
          child: Text(
            answerText,
            style: TextStyle(fontSize: 25,
            color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
