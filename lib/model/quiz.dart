import 'question.dart';

class Quiz {
  late final int id;
  late final String title;
  final List<Question> questions = [];

  Quiz(Map<String, Object?> json) {
    id = json["id"] as int;
    title = json["titulo"] as String;
    _getQuestions(json);
  }

  void _getQuestions(Map<String, Object?> json) {
    for (Map<String, Object> question in json["questoes"] as List) {
      questions.add(Question(question));
    }
  }
}
