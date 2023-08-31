part of home;

class QuizSliderController {
  List<Widget> getSecondLine(int length, int index, List<Quiz> quizzes) {
    return List.generate(
      length >= 2 ? length - 2 : 0,
      (cardIndex) {
        final realIndex = cardIndex + (4 * (index + 1) - 2);
        return QuizCard(
          realIndex,
          quizzes[realIndex],
        );
      },
    );
  }

  List<Widget> getFirstLine(int length, int index, List<Quiz> quizzes) {
    return List.generate(
      length >= 2 ? 2 : length,
      (cardIndex) {
        var realIndex = cardIndex + (4 * (index + 1) - 4);
        return QuizCard(
          realIndex,
          quizzes[realIndex],
        );
      },
    );
  }

  void insertSpace(List<Widget> line) {
    if (line.length == 1) {
      line.insert(1, const SizedBox(width: 16));
      line.insert(1, const Expanded(flex: 1, child: SizedBox()));
    } else {
      line.insert(1, const SizedBox(width: 16));
    }
  }

  int getPageCount(int quizzesLength) {
    if (quizzesLength % 4 != 0) {
      return quizzesLength ~/ 4 + 1;
    } else {
      return quizzesLength ~/ 4;
    }
  }

  List<List<Quiz>> getQuizGridList(List<Quiz> quizzes) {
    final gridList = <List<Quiz>>[];
    var quizList = <Quiz>[];

    for (var i = 1; i <= quizzes.length; i++) {
      quizList.add(quizzes[i - 1]);
      if (i % 4 == 0 || i == quizzes.length) {
        gridList.add(quizList);
        quizList = [];
      }
    }

    return gridList;
  }
}
