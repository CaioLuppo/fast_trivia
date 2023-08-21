class Question {
  late final int id;
  late final String title;
  late final String question;
  late final int answer;
  final List<Alternative> alternatives = [];

  Question(Map<String, dynamic> json) {
    id = json["id"] as int;
    title = json["titulo"] as String;
    question = json["pergunta"] as String;
    answer = json["gabarito"] as int;
    _getAlternatives(json);
  }

  void _getAlternatives(Map<String, dynamic> json) {
    for (Map<String, dynamic> alternative in json["alternativas"] as List) {
      alternatives.add(Alternative(alternative));
    }
  }

}

class Alternative {
  late final int id;
  late final String title;

  Alternative(Map<String, dynamic> json) {
    id = json["id"] as int;
    title = json["titulo"] as String;
  }
}
