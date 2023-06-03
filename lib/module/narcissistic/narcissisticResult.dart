import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:peaapp/layout/cubit/cubit.dart';
import 'package:peaapp/layout/cubit/state.dart';
import 'package:peaapp/layout/home_layout_screen.dart';
import 'package:peaapp/module/home/home_screen.dart';
import 'package:peaapp/shared/component/component.dart';
import 'narcissisticMain.dart';

class NarcissisticResult extends StatelessWidget {
  const NarcissisticResult(this.holder, this.resultScore, {Key key}) : super(key: key);

  final Function() holder;
  final int resultScore;

  String get resultPhrase {
    String resultText = '';
    if (resultScore >= 80) {
      resultText = 'You Are Very Narcissistic!';
    } else if (resultScore >= 60) {
      resultText = 'You Are Narcissistic!';
    } else if (resultScore >= 40){
      resultText = 'You Are Natural Narcissistic!';
    }else if(resultScore >= 20){
      resultText = 'You Are Not Very Narcissistic!';
    }else {
      resultText = 'You Are Not Narcissistic!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeaCubit, PeaStates>(
      listener: (context, state){},
      builder: (context, state){
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 190),
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
                Text(
                  resultPhrase,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  minWidth: 5,
                  onPressed: () {
                    String now =DateFormat('yyyy-MM-dd').format(DateTime.now());
                    NavigateAndFinish(context, HomeLayoutScreen());
                    PeaCubit.get(context).createNarcissisticScore(
                        score: resultScore,
                      dateTime:now,
                    );
                  },
                  child: Column(
                    children: [
                      Text('Save Result And ',
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                      Text(' Back To Home',
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
