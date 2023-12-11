import 'package:css_colors/css_colors.dart';
import 'package:flutter/widgets.dart';

import '../button.dart';
import 'side_notes/visibility_clone.dart';
import 'side_notes/opacity_clone.dart';
import 'side_notes/render_proxy_box_clone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Disappearing Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _DisappearingDemo1(),
            _DisappearingDemo2(),
          ],
        );
      },
      color: CSSColors.cadetBlue,
    );
  }
}

class _DisappearingDemo1 extends StatefulWidget {
  const _DisappearingDemo1({super.key});

  @override
  State<_DisappearingDemo1> createState() => _DisappearingDemo1State();
}

class _DisappearingDemo1State extends State<_DisappearingDemo1> {
  bool _isShrunk = false;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: CSSColors.black)),
            child: Visibility.maintain(
              visible: _isVisible,
              child: AnimatedScale(
                scale: _isShrunk ? 0 : 1,
                duration: const Duration(seconds: 1),
                onEnd: () {
                  setState(() {
                    if (_isShrunk && _isVisible) {
                      _isVisible = false;
                    }
                  });
                },
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: CSSColors.blue),
                    ),
                    child: ColoredBox(
                      color: CSSColors.red.withOpacity(0.5),
                      child: SizedBox.square(
                        dimension: 250,
                        child: Center(
                          child: Text(
                            'Text Text Text',
                            style: TextStyle(fontSize: 48),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )),
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
                    if (_isShrunk && !_isVisible) {
                      _isVisible = true;
                    }
                    _isShrunk = !_isShrunk;
                  });
                },
                text: 'Shrinking',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _DisappearingDemo2 extends StatefulWidget {
  const _DisappearingDemo2({super.key});

  @override
  State<_DisappearingDemo2> createState() => _DisappearingDemo2State();
}

class _DisappearingDemo2State extends State<_DisappearingDemo2> {
  bool _isShrunk = false;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: CSSColors.black)),
            child: Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: _isVisible,
              child: AnimatedScale(
                scale: _isShrunk ? 0 : 1,
                duration: const Duration(seconds: 1),
                onEnd: () {
                  setState(() {
                    if (_isShrunk && _isVisible) {
                      _isVisible = false;
                    }
                  });
                },
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: CSSColors.blue),
                    ),
                    child: ColoredBox(
                      color: CSSColors.red.withOpacity(0.5),
                      child: SizedBox.square(
                        dimension: 250,
                        child: Center(
                          child: Text(
                            'Text Text Text',
                            style: TextStyle(fontSize: 48),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )),
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
                    if (_isShrunk && !_isVisible) {
                      _isVisible = true;
                    }
                    _isShrunk = !_isShrunk;
                  });
                },
                text: 'Vanish',
              ),
            ],
          )
        ],
      ),
    );
  }
}
