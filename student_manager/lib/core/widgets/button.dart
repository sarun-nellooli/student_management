import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.btnText, required this.onPress})
      : super(key: key);
  final String btnText;
  Function() onPress = () {};
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        child: Text(btnText),
      ),
    );
  }
}
