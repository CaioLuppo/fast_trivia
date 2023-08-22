part of confirmation;

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.store,
  });

  final ConfirmationStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(
          bottom: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoetsenOne(
              store.title,
              fontSize: 23,
            ),
            InriaSans(
              "${store.questionsAmount} Questões",
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: TriviaColors.subtitles,
            ),
          ],
        ),
      ),
    );
  }
}
