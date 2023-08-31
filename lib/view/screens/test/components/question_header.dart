part of test;

class QuestionHeader extends StatelessWidget {
  final Question question;

  const QuestionHeader(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    int questionAmount = Provider.of<QuizStore>(context).quiz!.questions.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoetsenOne(question.title, fontSize: 23),
            PoetsenOne(
              "nº ${question.id} de $questionAmount",
              fontSize: 23,
              color: TriviaColors.subtitles,
            )
          ],
        ),
        const SizedBox(height: 8),
        InriaSans(question.question,
            fontSize: 23, alignment: TextAlign.justify),
      ],
    );
  }
}
