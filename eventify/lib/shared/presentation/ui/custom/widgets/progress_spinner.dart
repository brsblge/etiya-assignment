import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../extensions/build_context_ext.dart';

class ProgressSpinner extends StatefulWidget {
  const ProgressSpinner({
    super.key,
    this.color,
    this.size = 40,
    this.lineWidth = 3.2,
    this.duration = 500,
    this.backgroundColor,
  });

  final Color? color;
  final double size;
  final double lineWidth;

  /// The duration in milliseconds for one lap.
  /// Defaults to 500 milliseconds.
  final int duration;

  final Color? backgroundColor;

  @override
  State<ProgressSpinner> createState() => _ProgressSpinnerState();
}

class _ProgressSpinnerState extends State<ProgressSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )
      ..addListener(() => setState(() {}))
      ..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1, curve: Curves.linear),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.backgroundColor ?? Colors.transparent,
      child: Center(
        child: Transform(
          transform: Matrix4.identity()
            ..rotateZ(
              _animation.value * math.pi * 2,
            ),
          alignment: FractionalOffset.center,
          child: CustomPaint(
            painter: _SpinnerPainter(
              angle: 90,
              paintWidth: widget.lineWidth,
              color: widget.color ?? context.colorScheme.primaryDefault,
            ),
            child: SizedBox.fromSize(
              size: Size.square(widget.size),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _SpinnerPainter extends CustomPainter {
  _SpinnerPainter({
    required double angle,
    required double paintWidth,
    required Color color,
  })  : _angle = angle,
        _paint = Paint()
          ..color = color
          ..strokeWidth = paintWidth
          ..style = PaintingStyle.stroke;

  final Paint _paint;
  final double _angle;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawArc(rect, 0, _getRadian(_angle), false, _paint);
    canvas.drawArc(rect, _getRadian(180), _getRadian(_angle), false, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  // Helpers
  double _getRadian(double angle) => math.pi / 180 * angle;
  // - Helpers
}
