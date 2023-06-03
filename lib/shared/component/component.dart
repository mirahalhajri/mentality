import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function onSubmit,
  @required Function onChange,
  bool isPassword = false,
  @required Function onTap,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  @required IconData suffix,
  @required Function suffixPressd,
  bool isEnable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (s) {
        onSubmit();
      },
      obscureText: isPassword,
      onChanged: (s) {
        onChange(s);
      },

      validator: (value) {
      },
      enabled: isEnable,
      onTap: () {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 0.8),
        ),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
            onPressed: () {
              suffixPressd();
            },
            icon: Icon(suffix))
            : null,
      ),
    );

Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>
    TextButton(

      onPressed: () {
        function();
      },
      child: Text(text),
    );

Widget defaultButton({
  double width = double.infinity,
  Color backgroundColor =const Color(0xfffed4d5),
  @required Function function,
  double radius = 0,
  @required String text,
  bool isUppercase = true,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white,
            fontSize: 25
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backgroundColor,
      ),
    );

Widget MyDivider() => Container(
  width: double.infinity,
  height: 1,
  color: Colors.blue,
);

void NavigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void NavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void ShowToast({@required String text, @required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: ChoseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color ChoseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}


