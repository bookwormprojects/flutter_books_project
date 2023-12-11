import 'package:css_colors/css_colors.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Filled Bar Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return const _FilledBarDemo1();
      },
      color: CSSColors.cadetBlue,
    );
  }
}

class _FilledBarDemo1 extends StatefulWidget {
  const _FilledBarDemo1({super.key});

  @override
  State<_FilledBarDemo1> createState() => _FilledBarDemo1State();
}

class _FilledBarDemo1State extends State<_FilledBarDemo1> {
  static final _initialTween = Tween<double>(begin: 0, end: 0);
  Tween<double> _tween = _initialTween;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const padding = 8;
    width = width - 2 * padding;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: CSSColors.blue),
              ),
              child: SizedBox(
                height: 100,
                width: width,
                child: UnconstrainedBox(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 0,
                        maxWidth: width,
                        maxHeight: 100,
                        minHeight: 100),
                    child: TweenAnimationBuilder<double>(
                      tween: _tween,
                      duration: const Duration(seconds: 2),
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return ColoredBox(
                          color: CSSColors.red.withOpacity(0.5),
                          child: ClipRRect(
                            child: Align(
                              widthFactor: value,
                              alignment: Alignment.centerLeft,
                              child: ColoredBox(
                                color: CSSColors.green.withOpacity(0.2),
                                child: const SizedBox.expand(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Text Text Text',
                                      style: TextStyle(fontSize: 48),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
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
                    _tween = Tween(begin: 0, end: _tween.end == 1 ? 0 : 1);
                  });
                },
                text: 'Fill',
              ),
            ],
          )
        ],
      ),
    );
  }
}
