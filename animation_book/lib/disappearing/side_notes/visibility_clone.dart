import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class VisibilityClone extends StatelessWidget {
  const VisibilityClone({
    super.key,
    required this.visible,
    required this.child,
  });

  final bool visible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _VisibilityClone(
      visible: visible,
      child: child,
    );
  }
}

class _VisibilityClone extends SingleChildRenderObjectWidget {
  const _VisibilityClone({
    required this.visible,
    super.child,
  });

  final bool visible;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderVisibilityClone(visible);
  }
}

class _RenderVisibilityClone extends RenderProxyBox {
  _RenderVisibilityClone(this._visible);

  bool get visible => _visible;
  bool _visible;
  set visible(bool value) {
    if (value == visible) {
      return;
    }
    _visible = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (!visible) {
      return;
    }
    super.paint(context, offset);
  }
}
