import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;

  const LabelText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(text, style: Theme.of(context).textTheme.caption),
    );
  }
}
