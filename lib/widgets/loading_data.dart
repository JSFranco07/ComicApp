import 'package:comic_tech/widgets/custom_text_box.dart';
import 'package:flutter/material.dart';

/// Widget to let the client know a request is being loaded
class LoadingData extends StatelessWidget {
  /// Constructor
  const LoadingData({
    required this.text,
    Key? key,
  }) : super(key: key);

  /// Description to data loading
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(width: size.width * 0.05),
          CustomTextBox(width: size.width * 0.3, text: text),
        ],
      ),
    );
  }
}
