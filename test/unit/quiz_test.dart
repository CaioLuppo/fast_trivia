import "package:fast_trivia/controller/http/dao/quiz_dao.dart";
import "package:fast_trivia/model/quiz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart" as m;

import "quiz_test.mocks.dart";

@GenerateMocks([QuizDao])
void main() {
  test("Verifies if returns a instance with a proper map", () {
    final Map<String, dynamic> json = {
      "questionario": {
        "id": 1,
        "titulo": "Natureza brasileira",
        "questoes": [
          {
            "id": 1,
            "titulo": "Florestas brasileiras",
            "pergunta": "Qual o nome da maior floresta brasileira?",
            "gabarito": 4,
            "alternativas": [
              {"id": 1, "titulo": "Caatinga"},
              {"id": 2, "titulo": "Cerrado"},
              {"id": 3, "titulo": "Mata Atlântica"},
              {"id": 4, "titulo": "Amazônica"}
            ]
          },
          {
            "id": 2,
            "titulo": "Praias brasileiras",
            "pergunta": "Qual estado tem a maior faixa litorânea?",
            "gabarito": 3,
            "alternativas": [
              {"id": 1, "titulo": "São Paulo"},
              {"id": 2, "titulo": "Maranhão"},
              {"id": 3, "titulo": "Bahia"},
              {"id": 4, "titulo": "Rio de Janeiro"}
            ]
          }
        ]
      }
    };
    Object? quiz;

    try {
      quiz = Quiz(json);
    } catch (_) {}

    expect(quiz is Quiz, true);
  });

  test("Verifies if mock returns a valid data", () async {
    final QuizDao mock = MockQuizDao();
    final list = await mock.getQuestionnaries();

    expect(list.isNotEmpty, true);
  });
}
