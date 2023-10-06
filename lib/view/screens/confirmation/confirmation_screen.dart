library confirmation;

import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/view/global_components/button.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'components/body.dart';
part 'components/header.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuizStore>(context);

    return store.doingTest
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(store: store),
                const Body(),
                const SizedBox(
                  height: 16,
                ),
                ActionButton(
                  "Iniciar questionário",
                  () {
                    final quizStore =
                        Provider.of<QuizStore>(context, listen: false);
                    quizStore.answers[quizStore.quiz!.id] = ObservableMap();
                    changePageTo(TriviaPages.test);
                  },
                  color: TriviaColors.blue,
                )
              ],
            ),
          )
        : Container();
  }
}
