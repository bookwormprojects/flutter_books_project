import 'package:animation_book/button.dart';
import 'package:css_colors/css_colors.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Animated Container Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return const AnimatedContainerDemo1();
      },
      color: CSSColors.cadetBlue,
    );
  }
}

class AnimatedContainerDemo1 extends StatefulWidget {
  const AnimatedContainerDemo1({super.key});

  @override
  State<AnimatedContainerDemo1> createState() => _AnimatedContainerDemo1State();
}

class _AnimatedContainerDemo1State extends State<AnimatedContainerDemo1> {
  static final _decoration1 =
      BoxDecoration(color: CSSColors.blueViolet.withOpacity(0.5), boxShadow: [
    BoxShadow(
      color: CSSColors.grey.withOpacity(0.5),
      offset: const Offset(-10, -10),
    ),
  ]);

  static final _decoration2 =
      BoxDecoration(color: CSSColors.blueViolet.withOpacity(0.5), boxShadow: [
    BoxShadow(
      color: CSSColors.grey.withOpacity(0.85),
      offset: const Offset(10, 10),
    ),
  ]);

  bool _isBig = false;
  AlignmentGeometry _alignment = Alignment.centerRight;
  EdgeInsetsGeometry _padding = EdgeInsets.zero;
  // Color _color = CSSColors.grey.withOpacity(0.5);
  Decoration _decoration = _decoration1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: CSSColors.blue),
            ),
            child: SizedBox(
              width: 1000,
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      alignment: _alignment,
                      padding: _padding,
                      // color: _color,
                      duration: const Duration(seconds: 1),
                      width: _isBig ? 200 : 100,
                      height: _isBig ? 200 : 100,
                      decoration: _decoration,
                      child: const SizedBox.square(
                        dimension: 200,
                        child: ColoredBox(
                          color: CSSColors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              PlayButton(
                onTap: () {
                  setState(() {
                    _isBig = !_isBig;
                  });
                },
                text: 'Dimension',
              ),
              PlayButton(
                onTap: () {
                  setState(() {
                    _padding = _padding == EdgeInsets.zero
                        ? const EdgeInsets.all(10)
                        : EdgeInsets.zero;
                  });
                },
                text: 'Padding',
              ),
              // Button(
              //   onTap: () {
              //     setState(() {
              //       _color = _color == CSSColors.grey.withOpacity(0.5)
              //           ? CSSColors.black.withOpacity(0.5)
              //           : CSSColors.grey.withOpacity(0.5);
              //     });
              //   },
              //   text: 'Change Background Color',
              // ),
              PlayButton(
                onTap: () {
                  setState(() {
                    _decoration = _decoration == _decoration1
                        ? _decoration2
                        : _decoration1;
                  });
                },
                text: 'Decoration',
              ),
              PlayButton(
                onTap: () {
                  setState(() {
                    _alignment = _alignment == Alignment.centerLeft
                        ? Alignment.centerRight
                        : Alignment.centerLeft;
                  });
                },
                text: 'Alignment',
              )
            ],
          )
        ],
      ),
    );
  }
}
