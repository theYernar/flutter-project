import 'package:flutter/material.dart';

class BouncyButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? upperBound;

  const BouncyButton({
    super.key,
    required this.onTap,
    required this.child,
    this.upperBound,
  });

  @override
  State<BouncyButton> createState() => _BouncyButtonState();
}

class _BouncyButtonState extends State<BouncyButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 100),
          lowerBound: 0.0,
          upperBound: widget.upperBound ?? 0.1,
        )..addListener(() {
          setState(() {
            _scale = 1 - _controller.value;
          });
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _controller.forward(),
      onPointerUp: (_) => _controller.reverse(),
      onPointerCancel: (_) => _controller.reverse(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Transform.scale(
          scale: _scale,
          child: Opacity(opacity: _scale.clamp(0.8, 1.0), child: widget.child),
        ),
      ),
    );
  }
}
