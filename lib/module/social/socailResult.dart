import 'package:flutter/material.dart';
import 'package:peaapp/module/home/home_screen.dart';
import 'package:peaapp/module/sensitive/sensitiveMain.dart';
import 'package:peaapp/shared/component/component.dart';

class SensitiveResult extends StatelessWidget {
  const SensitiveResult(this.holder, this.resultScore, {Key key}) : super(key: key);

  final Function() holder;
  final int resultScore;

  String get resultPhrase {
    String resultText = '';
    if (resultScore >= 70) {
      resultText = 'You are awesome!';
    } else if (resultScore >= 40) {
      resultText = 'Pretty likable!';
    } else {
      resultText = 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Done!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Total Score = $resultScore',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Text(
          //   resultPhrase,
          //   style: TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.bold,
          //     color: isSwitched == false ? Colors.black : Colors.white,
          //   ),
          // ),
          MaterialButton(
            onPressed: () {
              NavigateAndFinish(context, HomeScreen());
            },
            child: Text('Back To Home',
                style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          )
        ],
      ),
    );
  }
}
