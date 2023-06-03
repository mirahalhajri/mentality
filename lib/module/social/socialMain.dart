import 'package:flutter/material.dart';
import 'package:peaapp/module/social/socialQuiz.dart';
import 'package:peaapp/module/social/socialResult.dart';


class SocialMain extends StatefulWidget {
  const SocialMain({Key key}) : super(key: key);

  @override
  State<SocialMain> createState() => _SocialMainState();
}

bool isSwitched = false;

class _SocialMainState extends State<SocialMain> {
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
      'questionText': '1.	Do you like meeting new people?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '2.	When I approach someone for conversation, I adjust to his/her level (I sit if he/she is sitting or stand if he/she is standing).',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score':7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '3.	I say or do insensitive things that upset my friends/co-workers.',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '4.	People tell me that I behave inappropriately in social situations.',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '5.	I make sure that my closest friends know that they are important to me.',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '6.	I explain my ideas clearly.',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '7.	I accept the people close to me for who they are, flaws and all.',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '8.	When I am explaining something, I make sure that my listeners are following me.',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '9.	I am at ease with people I don\'t know.',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '10.	If I have something relevant to add, it\'s OK to interrupt what someone else is saying.',
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
            child: _questionIndex < _questions.length
                ? SocialQuiz(_questions, _questionIndex, answerQuestion)
                : SocialResult(_resetQuiz, _totalScore),
          ),
        ),

    );
  }
}
