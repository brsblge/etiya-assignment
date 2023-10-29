import 'package:flutter/material.dart';

class ClampingScrollView extends StatelessWidget {
  const ClampingScrollView({
    super.key,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.padding,
    this.child,
  });

  final ScrollController? controller;
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      physics: const ClampingScrollPhysics(),
      scrollDirection: scrollDirection,
      padding: padding,
      child: child,
    );
  }
}
