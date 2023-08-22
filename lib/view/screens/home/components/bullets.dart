part of home;

class Bullets extends StatelessWidget {
  final int amount;
  final BulletStore bulletStore;
  final PageController pageController;

  const Bullets(
    this.bulletStore, {
    super.key,
    required this.amount,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          amount,
          (index) {
            bool active = index == bulletStore.activeIndex;
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () => pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: active ? 10 : 9,
                width: active ? 10 : 9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:
                      active ? TriviaColors.purple : TriviaColors.greyWidgets,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
