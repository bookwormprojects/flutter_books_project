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
      title: 'Controlled Spin Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return const _ControlledSpinDemo1();
      },
      color: CSSColors.cadetBlue,
    );
  }
}

class _ControlledSpinDemo1 extends StatefulWidget {
  const _ControlledSpinDemo1({super.key});

  @override
  State<_ControlledSpinDemo1> createState() => _ControlledSpinDemo1State();
}

class _ControlledSpinDemo1State extends State<_ControlledSpinDemo1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  );

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
              child: ClipRRect(
                child: RotationTransition(
                  turns: _controller,
                  child: ColoredBox(
                    color: CSSColors.blue.withOpacity(0.5),
                    child: SizedBox.square(
                      dimension: 250,
                    ),
                  ),
                ),
              )),
          const SizedBox(
            height: 4,
          ),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              PlayButton(
                onTap: () {
                  if (_controller.isAnimating) {
                    _controller.stop();
                  } else {
                    _controller.repeat();
                  }
                },
                text: 'Spin',
              ),
            ],
          )
        ],
      ),
    );
  }
}
