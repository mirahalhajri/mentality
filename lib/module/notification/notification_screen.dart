import 'package:flutter/cupertino.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          Text(
            'No Notifications Yet !',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
