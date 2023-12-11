import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class WidgetThatUsesRenderProxyBoxClone extends SingleChildRenderObjectWidget {
  const WidgetThatUsesRenderProxyBoxClone({super.key, super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderProxyBoxClone();
  }
}

class RenderProxyBoxClone extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin<RenderBox> {
  RenderProxyBoxClone([RenderBox? child]) {
    this.child = child;
  }
}
