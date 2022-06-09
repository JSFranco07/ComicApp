import 'package:comic_tech/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Widget to see errors in the app
class ErrorText extends StatelessWidget {
  /// Constructor
  const ErrorText({
    Key? key,
    required this.error,
  }) : super(key: key);

  /// Error message
  final String error;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: CustomTextBox(
        width: size.width * 0.7,
        text: error,
      ),
    );
  }
}
