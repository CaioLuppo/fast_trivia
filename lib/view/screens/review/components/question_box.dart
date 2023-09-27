part of review;

class QuestionBox extends StatelessWidget {
  final QuizStore quizStore;
  final int index;

  const QuestionBox({super.key, required this.quizStore, required this.index});

  @override
  Widget build(BuildContext context) {
    final Color color = quizStore.isCorrect(index) ? Colors.green : Colors.red;
    final Question question = quizStore.getQuizQuestion(index);
    final int selectedAlternative = quizStore.getSelectedAlternative(index);
    final Alternative correctAlternative =
        quizStore.getCorrectAlternative(question);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TriviaColors.lightGreyWidgets,
        border: Border.all(color: color, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoetsenOne("Pergunta:", fontSize: 19),
                PoetsenOne(
                  "nº${index + 1}",
                  fontSize: 19,
                  color: TriviaColors.subtitles,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: InriaSans(question.question, fontSize: 16),
            ),
            PoetsenOne("Alternativa escolhida:", fontSize: 19),
            ReviewAnswerBox(
              selectedAlternative,
              quizStore.getSelectedAlternativeTitle(
                questionIndex: index,
                selectedAlternative: selectedAlternative,
              ),
              correct: quizStore.isCorrect(index),
            ),
            returnCorrectAnswerIfNeeded(correctAlternative, quizStore, index),
          ],
        ),
      ),
    );
  }
}
