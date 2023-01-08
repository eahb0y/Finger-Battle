import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String text;
  const TextForm({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 40,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String buttonText;
  const ButtonText({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}
