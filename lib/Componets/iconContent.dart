import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  const IconContent(this.icon, this.text);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: kTextLableStyle,
        )
      ],
    );
  }
}
