part of test;

class QuestionPage extends StatelessWidget {
  final Question question;
  final AlternativeStore store;

  const QuestionPage(this.question, this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionHeader(question),
        AlternativesSession(store, question),
        const Spacer(),
      ],
    );
  }
}
