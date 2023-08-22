part of home;

class QuizesSession extends StatelessWidget {
  final String title;
  final Future<List<Quiz>> Function() futureFunction;
  final String emptyMessage;

  const QuizesSession({
    required this.title,
    required this.futureFunction,
    required this.emptyMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 224 + 16, // Padding dos bullets
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PoetsenOne(
                title,
                fontSize: 23,
              ),
            ),
            const SizedBox(height: 16),
            FutureBuilder(
              future: futureFunction(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: TriviaColors.blue,
                      ),
                    ),
                  );
                } else {
                  if (snapshot.hasData) {
                    return QuizSlider(snapshot.data as List<Quiz>);
                  }
                  return Center(
                    child: InriaSans(
                      emptyMessage,
                      fontSize: 16,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
