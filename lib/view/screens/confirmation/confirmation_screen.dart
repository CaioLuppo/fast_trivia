library confirmation;

import 'package:fast_trivia/controller/store/confirmation_store.dart';
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
    final store = Provider.of<ConfirmationStore>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(store: store),
              const Body(),
              ActionButton(
                "Iniciar questionário",
                () {},
                color: TriviaColors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
