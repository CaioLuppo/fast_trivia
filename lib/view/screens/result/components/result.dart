part of result;

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    QuizStore store = Provider.of<QuizStore>(context);
    String resultMessage = "";
    Color resultColor = Colors.black;

    if (store.percent > 0 && store.percent < 100) {
      resultMessage = "Quase lá!";
      resultColor = TriviaColors.purple;
    } else if (store.percent == 0) {
      resultMessage = "Oops! 🤔";
      resultColor = TriviaColors.red;
    } else {
      resultMessage = "Parabéns!";
      resultColor = TriviaColors.green;
    }

    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PoetsenOne(resultMessage, color: resultColor, fontSize: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: SizedBox(
                height: 156,
                width: 156,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: CircularProgressIndicator(
                        value: store.percent / 100,
                        strokeWidth: 8,
                        color: resultColor,
                        backgroundColor: TriviaColors.greyWidgets,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PoetsenOne(
                          "${store.percent.toStringAsFixed(0)}%",
                          fontSize: 40,
                          color: resultColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: InriaSans(
                            "${store.correctAnswers}/${store.quiz!.questions.length} Questões corretas.",
                            fontSize: 16,
                            alignment: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 242,
              height: 72,
              child: InriaSans(
                "Se quiser revisar suas respostas, clique em \"Revisar teste\".",
                fontSize: 19,
                alignment: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
