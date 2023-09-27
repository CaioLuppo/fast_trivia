part of review;

class ReviewAnswerBox extends StatelessWidget {
  final bool correct;
  final int index;
  final String question;
  const ReviewAnswerBox(this.index, this.question,
      {required this.correct, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: correct ? TriviaColors.green10 : TriviaColors.red10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SvgPicture.asset(
              correct ? "assets/correct.svg" : "assets/wrong.svg",
            ),
            const SizedBox(
              width: 12,
            ),
            InriaSans(
              "${getAlternativeLetter(index)} - $question",
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
