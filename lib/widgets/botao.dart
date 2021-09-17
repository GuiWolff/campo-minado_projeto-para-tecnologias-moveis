
import 'package:flutter/material.dart';
import 'package:trabalho1/widgets/textos.dart';

class ButtonApp extends StatelessWidget {
  final double width;
  final String text;
  final double height;
  final double fontSize;
  final Function()? onPressed;
  final bool circleRadius;
  final bool enabled;
  final Color color;
  final Color textColor;

  ButtonApp(
      this.text, {
        this.width = 250,
        this.height = 54,
        this.circleRadius = false,
        this.onPressed,
        this.enabled = true,
        this.color = Colors.orange,
        this.textColor = Colors.white,
        this.fontSize = 10
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
          primary: enabled ? color : Colors.grey[100],
          minimumSize: Size(width, height),
          elevation: 2,
          shape: circleRadius == false
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              : RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/2))
      ),
      child: Container(
          margin: EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
          child: TextBody(text, color: enabled ? textColor : Colors.grey, fontSize: fontSize,)),
    );
  }
}