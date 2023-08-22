part of home;

class QuizCard extends StatelessWidget {
  final int questionAmount;
  final String quizTitle;
  final int index;

  static int cardAmount = 0;
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

  QuizCard(
    this.index,
    this.questionAmount,
    this.quizTitle, {
    super.key,
  }) {
    cardAmount++;
  }

  @override
  Widget build(BuildContext context) {
    final appbarStore = Provider.of<TriviaAppBarStore>(context, listen: false);
    final confirmationStore = Provider.of<ConfirmationStore>(
      context,
      listen: false,
    );

    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          MainApp.pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
          confirmationStore.updateConfirmationScreen(quizTitle, questionAmount);
          appbarStore.updateProperties(showBackButton: true);
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: 124,
                  height: 20,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: PoetsenOne(
                      quizTitle,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: InriaSans(
                    "$questionAmount Questões",
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
    );
  }
}
