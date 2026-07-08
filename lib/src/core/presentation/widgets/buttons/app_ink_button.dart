import 'package:flutter/material.dart';

class AppInkButton extends StatelessWidget {
  const AppInkButton({
    required this.child,
    this.onTap,
    this.color = Colors.transparent,
    this.borderRadius,
    this.shape,
    this.width,
    this.height,
    this.padding,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.antiAlias,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final Color color;
  final BorderRadius? borderRadius;
  final ShapeBorder? shape;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    Widget content = Align(alignment: alignment, child: child);
    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }
    if (width != null || height != null) {
      content = SizedBox(width: width, height: height, child: content);
    }

    return Material(
      color: color,
      shape: shape,
      borderRadius: shape == null ? borderRadius : null,
      clipBehavior: clipBehavior,
      child: InkWell(
        onTap: onTap,
        borderRadius: shape == null ? borderRadius : null,
        customBorder: shape,
        child: content,
      ),
    );
  }
}
