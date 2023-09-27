library result;

import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/controller/components/result_controller.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/model/store/review_store.dart';
import 'package:fast_trivia/view/global_components/button.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'components/result.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Result(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ActionButton(
            "Revisar teste",
            () {
              Provider.of<ReviewStore>(context, listen: false)
                  .setReviewing(true);
              changeToPreviousPage(context, reviewing: true);
            },
            disabled: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: ActionButton(
            "Voltar para tela inicial",
            () => changeToPreviousPage(context),
            disabled: false,
            color: TriviaColors.blue,
          ),
        ),
      ],
    );
  }
}
