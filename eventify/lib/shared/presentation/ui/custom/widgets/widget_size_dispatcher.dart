import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WidgetSizeDispatcher extends SingleChildRenderObjectWidget {
  const WidgetSizeDispatcher({
    super.key,
    required this.onSizeChange,
    required Widget child,
  }) : super(child: child);

  final void Function(Size size) onSizeChange;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _WidgetSizeRenderObject(onSizeChange);
  }
}

class _WidgetSizeRenderObject extends RenderProxyBox {
  _WidgetSizeRenderObject(this.onSizeChange);

  final void Function(Size size) onSizeChange;
  Size? currentSize;

  @override
  void performLayout() {
    super.performLayout();

    try {
      final newSize = child?.size;

      if (newSize != null && currentSize != newSize) {
        currentSize = newSize;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onSizeChange(newSize);
        });
      }
    } catch (_) {}
  }
}
