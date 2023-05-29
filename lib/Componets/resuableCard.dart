import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  ResuableCard({@required this.color, this.cardChild, this.onPress});

  final Color? color;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  GestureDetector build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
