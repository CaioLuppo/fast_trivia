part of confirmation;

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoetsenOne(
            "Instruções: ",
            fontSize: 19,
          ),
          _identedInria(
            [
              "Reserve tempo e um espaço tranquilo para responder;",
              "Selecione alguma das alternativas para prosseguir;",
              "Tente se esforçar, para garantir a melhor nota! ;)",
            ],
            fontSize: 19,
          )
        ],
      ),
    );
  }
}

Widget _identedInria(List<String> texts, {required double fontSize}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        texts.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InriaSans(
                "  \u2E31  ",
                fontSize: fontSize,
                fontWeight: FontWeight.w200,
              ),
              Expanded(
                child: InriaSans(
                  texts[index],
                  fontSize: fontSize,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
