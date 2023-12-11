import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui show Color;

class OpacityClone extends SingleChildRenderObjectWidget {
  const OpacityClone({
    super.key,
    required this.opacity,
    super.child,
  }) : assert(opacity >= 0.0 && opacity <= 1.0);

  final double opacity;

  @override
  RenderOpacityClone createRenderObject(BuildContext context) {
    return RenderOpacityClone(
      opacity: opacity,
    );
  }
}

class RenderOpacityClone extends RenderProxyBox {
  RenderOpacityClone({
    double opacity = 1.0,
    bool alwaysIncludeSemantics = false,
    RenderBox? child,
  }) : assert(opacity >= 0.0 && opacity <= 1.0),
        _opacity = opacity,
        _alpha = ui.Color.getAlphaFromOpacity(opacity),
        super(child);

  @override
  bool get alwaysNeedsCompositing => child != null && _alpha > 0;

  @override
  bool get isRepaintBoundary => alwaysNeedsCompositing;

  int _alpha;

  double get opacity => _opacity;
  double _opacity;
  set opacity(double value) {
    assert(value >= 0.0 && value <= 1.0);
    if (_opacity == value) {
      return;
    }
    final bool didNeedCompositing = alwaysNeedsCompositing;
    _opacity = value;
    _alpha = ui.Color.getAlphaFromOpacity(_opacity);
    if (didNeedCompositing != alwaysNeedsCompositing) {
      markNeedsCompositingBitsUpdate();
    }
    markNeedsCompositedLayerUpdate();
  }

  @override
  bool paintsChild(RenderBox child) {
    assert(child.parent == this);
    return _alpha > 0;
  }

  @override
  OffsetLayer updateCompositedLayer({required covariant OpacityLayer? oldLayer}) {
    final OpacityLayer layer = oldLayer ?? OpacityLayer();
    layer.alpha = _alpha;
    return layer;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null || _alpha == 0) {
      return;
    }
    super.paint(context, offset);
  }
}