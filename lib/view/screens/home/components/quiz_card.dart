part of home;

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  final int index;
  final bool shouldReview;

  static const colors = [
    TriviaColors.blue,
    TriviaColors.green,
    TriviaColors.purple,
    TriviaColors.red,
    TriviaColors.yellow,
  ];
  Color get color {
    if (index % 10 >= 5) {
      return colors[(index % 10) - 5];
    } else {
      return colors[index % 10];
    }
  }

  const QuizCard(
    this.index,
    this.quiz, {
    super.key,
    this.shouldReview = false,
  });

  @override
  Widget build(BuildContext context) {
    final appbarStore = Provider.of<TriviaAppBarStore>(context, listen: false);
    final quizStore = Provider.of<QuizStore>(
      context,
      listen: false,
    );

    return Expanded(
      child: InkWell(
        onTap: () {
          if (quizStore.answers.containsKey(quiz.id)) {
            quizStore.setDoingTest(false);
            Provider.of<ReviewStore>(context, listen: false).setReviewing(true);
            changePageTo(TriviaPages.review);
          } else {
            quizStore.setDoingTest(true);
            changePageTo(TriviaPages.confirmation);
          }
          quizStore.updateConfirmationScreen(quiz);
          appbarStore.updateProperties(showBackButton: true);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: color),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  color: Colors.black12,
                )
              ],
            ),
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PoetsenOne(
                      quiz.title,
                      fontSize: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: InriaSans(
                        "${quiz.questions.length} Questões",
                        color: TriviaColors.subtitles,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
