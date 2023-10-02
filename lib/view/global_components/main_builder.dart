part of main;

Builder fastTriviaBuilder(PageController pageController) {
  return Builder(
    builder: (context) {
      DatabaseDAO.loadAnswers(context);
      final appBarStore = Provider.of<TriviaAppBarStore>(
        context,
        listen: false,
      );
      return WillPopScope(
        onWillPop: () => onWillPop(context, pageController, appBarStore),
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 98.0),
                  child: Observer(
                    builder: (_) {
                      return PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (pageIndex) {
                          TriviaAppBar.updateProperties(
                            context,
                            pageIndex == TriviaPages.home.index ? false : true,
                            pageIndex >= TriviaPages.test.index ? true : false,
                          );
                        },
                        controller: pageController,
                        children: const [
                          HomeScreen(),
                          ConfirmationScreen(),
                          TestScreen(),
                          ReviewScreen(),
                          ResultScreen(),
                        ],
                      );
                    },
                  ),
                ),
                Observer(
                  builder: (_) => TriviaAppBar(
                    elevate: appBarStore.elevate,
                    showBackButton: appBarStore.showBackButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
