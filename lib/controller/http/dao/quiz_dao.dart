import 'dart:convert';

import 'package:fast_trivia/controller/http/credentials.dart';
import 'package:fast_trivia/model/quiz.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

// Classe que funcionaria caso houvesse comunicação com API.
@GenerateMocks([QuizDao])
class QuizDao {
  static List<Quiz> quizzes = [];

  Future<List<Quiz>> getQuestionnaries() async {
    final response = await http.get(apiUrl);
    final Map<String, dynamic> json = jsonDecode(response.body);
    QuizDao.quizzes = _convertList(json);

    return quizzes;
  }

  List<Quiz> _convertList(Map<String, dynamic> json) {
    final List<Quiz> listQuiz = [];
    for (String key in json.keys) {
      listQuiz.add(Quiz(json[key]));
    }
    return listQuiz;
  }
}
