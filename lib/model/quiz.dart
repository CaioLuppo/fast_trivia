import 'question.dart';

class Quiz {
  late final int id;
  late final String title;
  final List<Question> questions = [];

  Quiz(Map<String, dynamic> json) {
    final quiz = json["questionario"];
    id = quiz["id"] as int;
    title = quiz["titulo"] as String;
    _getQuestions(quiz);
  }

  void _getQuestions(Map<String, dynamic> json) {
    for (Map<String, dynamic> question in json["questoes"] as List) {
      questions.add(Question(question));
    }
  }
}
