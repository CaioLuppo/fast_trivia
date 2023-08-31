part of test;

class AlternativeWidget extends StatelessWidget {
  final int index;
  final String title;
  final AlternativeStore store;

  const AlternativeWidget(this.store, this.index, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        bool isSelected = store.selectedAlternative == index;
        return Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            color: isSelected
                ? TriviaColors.blue
                : TriviaColors.unselectedAlternative,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => store.updateSelected(index),
              borderRadius: BorderRadius.circular(8),
              highlightColor: Colors.black26,
              splashColor: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 24, 16),
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white
                          : TriviaColors.unselectedAlternativeCircle,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: isSelected
                        ? Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: TriviaColors.blue,
                                borderRadius: BorderRadius.circular(16)),
                          )
                        : null,
                  ),
                  InriaSans(
                    "${getAlternativeLetter(index)} - $title",
                    fontSize: 19,
                    color: isSelected ? Colors.white : null,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
