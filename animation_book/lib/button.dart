import 'package:flutter/widgets.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, required this.onTap, required this.text});

  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Button(onTap: onTap, text: '$text \u{25B6}');
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.onTap, required this.text});

  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: DecoratedBox(
        decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(side: BorderSide(width: 2))),
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
        ),
      ),
    );
  }
}
