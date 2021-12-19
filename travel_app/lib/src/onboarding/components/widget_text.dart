import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  const WidgetText(
      {Key? key, required this.text, required this.color, this.size = 30})
      : super(key: key);
  final double size;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
    
  }
}
