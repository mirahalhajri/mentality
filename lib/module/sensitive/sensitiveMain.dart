import 'package:flutter/material.dart';
import 'package:peaapp/module/sensitive/sensitiveQuiz.dart';
import 'sensitiveResult.dart';


class SensitiveMain extends StatefulWidget {
  const SensitiveMain({Key key}) : super(key: key);

  @override
  State<SensitiveMain> createState() => _SensitiveMainState();
}

bool isSwitched = false;

class _SensitiveMainState extends State<SensitiveMain> {
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
      'questionText': '1.	You always arrive late for work.. your manager wanted to comment on this delay. What will you think?',
      'answers': [
        {'text': 'A. You think he’s a bad person who stalks you', 'score': 10},
        {'text': 'B. You are so ashamed of yourself and wish you weren’t visible', 'score': 7},
        {'text': 'C. You think it’s nothing so important', 'score': 5},
        {'text': 'D. You think you’re doing what you have to do your job so you shouldn’t worry about something like that', 'score': 1},
      ]
    },
    {
      'questionText': '2.	Have you ever cried while watching a movie?',
      'answers': [
        {'text': 'A. Yes, all sad tragedies make me cry', 'score': 10},
        {'text': 'B. Yes, in rare cases', 'score': 7},
        {'text': 'C. Am not affected but in some cases I may cry', 'score': 5},
        {'text': 'D. I never get effected', 'score': 1},
      ]
    },
    {
      'questionText': '3.	You and your team did something important on the job and when you handed it over to the manager he started to praise your team more than you personally. What will you think?',
      'answers': [
        {'text': 'A. You think that the manager is deliberately doing this to make you feel neglected', 'score': 10},
        {'text': 'B. It feels fair that you cant compete anyway', 'score': 7},
        {'text': 'C. You think it doesn’t matter, its an integral part of life and work in the office', 'score': 5},
        {'text': 'D. You think its ridiculous because you’ve worked harder than anyone else', 'score': 1},
      ]
    },
    {
      'questionText': '4.	You fell in a place where people gather and everyone is looking at you, what you will do?',
      'answers': [
        {'text': 'A. Gives a few sharp looks to anyone who laughs', 'score': 10},
        {'text': 'B. You get up and run fast, hoping no one will see you', 'score': 7},
        {'text': 'C. She says oh my god don’t get my clothes dirty with some smile', 'score':5},
        {'text': 'D. You think that people should come to help you', 'score': 1},
      ]
    },
    {
      'questionText': '5.	Do you like the felling you get after receiving a gift?',
      'answers': [
        {'text': 'A. Yes, it feels great', 'score': 10},
        {'text': 'B. Yes, I enjoy it very much', 'score': 7},
        {'text': 'C. I don’t like this feeling', 'score': 5},
        {'text': 'D. I don’t usually fell anything', 'score': 1},
      ]
    },
    {
      'questionText': '6.	During a party, a friend said about you that you are a sensitive person, what would your reaction be?',
      'answers': [
        {'text': 'A. You get so angry with these words', 'score': 10},
        {'text': 'B. You feel the wound as you think that there is a problem', 'score': 7},
        {'text': 'C. You’re disappointed that they think of you that way', 'score': 5},
        {'text': 'D. You tell them that their opinion is naïve', 'score': 1},
      ]
    },
    {
      'questionText': '7.	Do other peoples mood affect you ?',
      'answers': [
        {'text': 'A. Strongly Agree', 'score': 10},
        {'text': 'B. Agree', 'score': 7},
        {'text': 'C. Disagree', 'score': 5},
        {'text': 'D. Disagree Somewhat', 'score': 1},
      ]
    },
    {
      'questionText': '8.	Can not bear:',
      'answers': [
        {'text': 'A. When people tell you what to do', 'score': 10},
        {'text': 'B. When people compare you to anyone else', 'score': 7},
        {'text': 'C. When people ask you to step aside', 'score': 5},
        {'text': 'D. People who don’t show respect to you', 'score': 1},
      ]
    },
    {
      'questionText': '9.	Do you get angry easily?',
      'answers': [
        {'text': 'A. Yes am quick to anger', 'score': 10},
        {'text': 'B. Yes I get angry from time to time', 'score': 7},
        {'text': 'C. I don’t think am an angry person', 'score': 5},
        {'text': 'D. No I never get angry', 'score': 1},
      ]
    },
    {
      'questionText': '10.	Do you annoyed when people try to get you to do too many things at once?',
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
                ? SensitiveQuiz(_questions, _questionIndex, answerQuestion)
                : SensitiveResult(_resetQuiz, _totalScore),
          ),
        ),

    );
  }
}
