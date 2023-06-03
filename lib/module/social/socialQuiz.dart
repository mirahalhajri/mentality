import 'package:flutter/material.dart';
import 'package:peaapp/module/social/socialAnswer.dart';
import 'package:peaapp/module/social/socialQuestion.dart';


class SocialQuiz extends StatelessWidget {
  const SocialQuiz(
    this.questions,
    this.questionIndex,
    this.answerQuestion, {
    Key key,
  }) : super(key: key);

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int s) answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: Colors.grey[300],
                ),
                child: SocialQuestion(questions[questionIndex]['questionText'].toString())),
          ),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return SocialAnswer(
                () => answerQuestion(int.parse(answer['score'].toString())),
                answer['text'].toString());
          }).toList(),
        ],
      ),
    );
  }
}
