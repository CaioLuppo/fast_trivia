library confirmation;

import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/controller/util/system.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/view/global_components/button.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

part 'components/header.dart';
part 'components/body.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    lockOrientation(false);
    final store = Provider.of<QuizStore>(context);

    return Padding(
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
              changePageTo(TriviaPages.test);
            },
            color: TriviaColors.blue,
          )
        ],
      ),
    );
  }
}
