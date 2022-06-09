import 'package:flutter/material.dart';

/// Widget para cargar imágenes desde los assets
class CustomCard extends StatelessWidget {
  /// Constructor
  const CustomCard({
    required this.child,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// Ruta de la imagen
  final Widget child;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
