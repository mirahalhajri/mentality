import 'package:flutter/material.dart';
import 'sensitiveQuestion.dart';
import 'sensitiveAnswer.dart';

class SensitiveQuiz extends StatelessWidget {
  const SensitiveQuiz(
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
                child: SensitiveQuestion(questions[questionIndex]['questionText'].toString())),
          ),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return SensitiveAnswer(
                () => answerQuestion(int.parse(answer['score'].toString())),
                answer['text'].toString());
          }).toList(),
        ],
      ),
    );
  }
}
