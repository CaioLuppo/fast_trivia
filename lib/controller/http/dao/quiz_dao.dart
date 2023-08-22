import 'dart:convert';

import 'package:fast_trivia/controller/http/credentials.dart';
import 'package:fast_trivia/model/quiz.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([QuizDao])
class QuizDao {
  Future<List<Quiz>> getQuestionnaries() async {
    final response = await http.get(apiUrl);
    final Map<String, dynamic> json = jsonDecode(response.body);
    
    return _convertList(json);
  }

  List<Quiz> _convertList(Map<String, dynamic> json) {
    final List<Quiz> listQuiz = [];
    for (String key in json.keys) {
      listQuiz.add(Quiz(json[key]));
    }
    return listQuiz;
  }
}
