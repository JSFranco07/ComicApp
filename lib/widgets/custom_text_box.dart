import 'package:flutter/material.dart';

/// Widget responsive text
class CustomTextBox extends StatelessWidget {
  /// Constructor
  const CustomTextBox({
    Key? key,
    required this.width,
    required this.text,
    this.style,
  }) : super(key: key);

  /// Width
  final double width;

  /// Text
  final String text;

  /// The text style
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          text,
          style: style ?? Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
