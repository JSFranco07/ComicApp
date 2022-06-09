import 'package:comic_tech/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
GetSnackBar customSnackBar({
  required BuildContext context,
  required String message,
  bool? isConnectionMessage = false,
  Color? color,
  int? duration,
}) {
  final size = MediaQuery.of(context).size;
  return GetSnackBar(
    snackStyle: SnackStyle.GROUNDED,
    messageText: _CustomWidget(
      text: message,
    ),
    duration: Duration(seconds: duration ?? 5),
    backgroundColor: isConnectionMessage!
        ? Colors.grey[700]!
        : color ??
            const Color(
              0xFFE70221,
            ),
    margin: EdgeInsets.zero,
    padding: EdgeInsets.symmetric(
      vertical: CalculatedSize.calculatedHeight(
        20,
        size.height,
      ),
      horizontal: CalculatedSize.calculatedWidth(
        10,
        size.width,
      ),
    ),
    snackPosition: SnackPosition.TOP,
  );
}

class _CustomWidget extends StatefulWidget {
  const _CustomWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  State<_CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<_CustomWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _animation = Tween(begin: 20.0, end: 30.0).animate(
      _animationController,
    );

    _animationController.forward().whenComplete(() {
      _animationController.reverse();
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Icon(
                Icons.wifi_off_rounded,
                size: _animation.value,
                color: Colors.white,
              );
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
