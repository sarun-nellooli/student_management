import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.btnText, required this.onPress})
      : super(key: key);
  String btnText;
  Function() onPress = () {};
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(btnText),
        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
      ),
    );
  }
}
