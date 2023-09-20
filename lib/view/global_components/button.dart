import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;
  final bool disabled;

  const ActionButton(
    this.text,
    this.onPressed, {
    this.color,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: color == null ? Border.all(color: Colors.black) : null,
        color: color != null
            ? (disabled ? TriviaColors.greyWidgets : color)
            : Colors.transparent,
        boxShadow: color != null && !disabled
            ? const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                )
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: PoetsenOne(
                text,
                fontSize: 19,
                color: color != null ? Colors.white : null,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onPressed,
              hoverColor: color != null ? Colors.white12 : null,
              splashColor: color != null ? Colors.white12 : null,
              highlightColor: color != null ? Colors.white12 : null,
            ),
          ],
        ),
      ),
    );
  }
}
