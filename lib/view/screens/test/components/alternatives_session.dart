part of test;

class AlternativesSession extends StatelessWidget {
  final Question question;
  final AlternativeStore store;

  const AlternativesSession(this.store, this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: PoetsenOne("Selecione uma alternativa:", fontSize: 19),
              ),
            ] +
            List.generate(
              question.alternatives.length,
              (index) {
                Alternative alternative = question.alternatives[index];
                return AlternativeWidget(
                  store,
                  alternative.id,
                  alternative.title,
                  question.id,
                );
              },
            ),
      ),
    );
  }
}
