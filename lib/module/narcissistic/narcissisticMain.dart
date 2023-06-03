import 'package:flutter/material.dart';
import 'package:peaapp/layout/cubit/cubit.dart';
import 'narcissisticQuiz.dart';
import 'narcissisticResult.dart';



class NarcissisticMain extends StatefulWidget {
  const NarcissisticMain({Key key}) : super(key: key);

  @override
  State<NarcissisticMain> createState() => _NarcissisticMainState();
}

bool isSwitched = false;

class _NarcissisticMainState extends State<NarcissisticMain> {
  int _questionIndex = 0;
  int _totalScore = 0;

  answerQuestion(int score) {
    print('Answer Chosen!');
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    print(_questionIndex);
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText': '1. Do you experience an exaggerated sense of self-importance that frequently involves the talents or accomplishments?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '2. Do you believe you are special and unique and can only be understood by, or should associate with, other special or high-status people or institutions?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '3. Do you find that you constantly have a willingness to takes advantage of others to achieve your own goals?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '4. Do you require excessive admiration from others?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '5.Are you preoccupied with fantasies of unlimited success, power, brilliance, beauty, or ideal love?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '6. Do you have a sense of entitlement from others that involve unreasonable expectations of especially favorable treatment or automatic compliance with their expectations?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '7. Do you find you are unwilling to recognize or identify with the feelings and needs of others?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '8. Do others perceive you as arrogant or snobby?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '9. Do you find that you are often envious of others and/or believe that others are envious of you?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score':7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '10. Do you love your personal and private things and feel that no one else has the right to touch them?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
         physics: BouncingScrollPhysics(),
          child: Container(
            child: _questionIndex < _questions.length?
            NarcissisticQuiz(_questions, _questionIndex, answerQuestion)
            : NarcissisticResult(_resetQuiz, _totalScore),
          ),
        ),

    );
  }


}

