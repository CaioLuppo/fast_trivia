part of home;

class QuizSlider extends StatelessWidget {
  final List<Quiz> quizzes;
  final PageController pageController = PageController(initialPage: 0);

  QuizSlider(this.quizzes, {super.key});

  @override
  Widget build(BuildContext context) {
    final BulletStore bulletStore = BulletStore();
    final QuizSliderController controller = QuizSliderController();

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (page) => bulletStore.updateActiveIndex(page),
              itemCount: controller.getPageCount(quizzes.length),
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemBuilder: (context, index) {
                final gridList = controller.getQuizGridList(quizzes);
                final int length = gridList[index].length;
                final firstLine =
                    controller.getFirstLine(length, index, quizzes);
                final secondLine =
                    controller.getSecondLine(length, index, quizzes);
                controller.insertSpace(firstLine);
                controller.insertSpace(secondLine);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(children: [
                    Row(children: firstLine),
                    const SizedBox(height: 16),
                    Row(children: secondLine),
                  ]),
                );
              },
            ),
          ),
          Bullets(
            bulletStore,
            amount: controller.getPageCount(quizzes.length),
            pageController: pageController,
          )
        ],
      ),
    );
  }
}
