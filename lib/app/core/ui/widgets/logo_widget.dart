import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String _text;
  const LogoWidget({super.key, required String text}) : _text = text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          _text,
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
