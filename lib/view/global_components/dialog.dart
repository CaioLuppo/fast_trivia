import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';

Future showAlertDialog(
  BuildContext context, {
  required String title,
  String? description,
  void Function()? yes,
  void Function()? no,
}) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Center(child: PoetsenOne(title, fontSize: 19)),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: [
        TextButton(
          onPressed: yes,
          child: InriaSans(
            "SIM",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: TriviaColors.blue,
          ),
        ),
        TextButton(
          onPressed: no,
          child: InriaSans(
            "NÃO",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: TriviaColors.blue,
          ),
        ),
      ],
      content: description != null
          ? InriaSans(
              description,
              fontSize: 16,
              alignment: TextAlign.center,
            )
          : null,
    ),
  );
}
