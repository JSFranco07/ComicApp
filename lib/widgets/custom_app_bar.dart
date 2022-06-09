import 'package:flutter/material.dart';

/// Custom AppBar
PreferredSizeWidget customAppBar({
  required BuildContext context,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Text(
      'Comic Book',
      style: Theme.of(context).textTheme.headline3,
    ),
    centerTitle: true,
    actions: actions,
  );
}
