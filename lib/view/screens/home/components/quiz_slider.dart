part of home;

class QuizSlider extends StatelessWidget {
  final List<Quiz> quizzes;
  final PageController pageController = PageController(initialPage: 0);

  QuizSlider(this.quizzes, {super.key});

  @override
  Widget build(BuildContext context) {
    final BulletStore bulletStore = BulletStore();
  
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (page) => bulletStore.updateActiveIndex(page),
              itemCount: getPageCount(quizzes.length),
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemBuilder: (context, index) {
                var gridList = getQuizGridList();
                var length = gridList[index].length;

                List<Widget> firstLine = List.generate(
                  length >= 2 ? 2 : length,
                  (cardIndex) => QuizCard(
                    cardIndex + (4 * index - 4) - 1,
                    24,
                    "testinho",
                  ),
                );
                List<Widget> secondLine = List.generate(
                  length >= 2 ? length - 2 : 0,
                  (cardIndex) => QuizCard(
                    (cardIndex + (4 * index - 6) - 1),
                    24,
                    "testinho",
                  ),
                );

                insertSpace(firstLine);
                insertSpace(secondLine);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(children: firstLine),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: secondLine,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Bullets(
            bulletStore,
            amount: getPageCount(quizzes.length),
            pageController: pageController,
          )
        ],
      ),
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

  List<List<Quiz>> getQuizGridList() {
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
