import 'package:fast_trivia/controller/database/database.dart';
import 'package:fast_trivia/controller/http/dao/quiz_dao.dart';
import 'package:fast_trivia/controller/http/dao/quiz_dao.mocks.dart';
import 'package:fast_trivia/model/quiz.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class DatabaseDAO {
  static void saveAnswers(BuildContext context, {required int quizId}) async {
    final store = Provider.of<QuizStore>(context, listen: false);
    final db = await AnswersDatabase.getInstance();

    await db.query("answers", where: "quizId = $quizId").then((result) {
      if (result.isEmpty) {
        store.answers[quizId]!.forEach((key, value) async {
          await db.insert("answers", {
            "quizId": quizId,
            "questionId": key,
            "answerId": value,
          });
        });
      } else {
        store.answers[quizId]!.forEach((key, value) async {
          await db.update(
            "answers",
            {
              "questionId": key,
              "answerId": value,
            },
            where: "quizId = $quizId",
          );
        });
      }
    });
  }

  static void loadAnswers(BuildContext context) async {
    final store = Provider.of<QuizStore>(context, listen: false);
    final db = await AnswersDatabase.getInstance();

    db.query("answers").then((value) {
      for (var map in value) {
        store.addAnswer(
          map["questionId"]! as int,
          map["answerId"]! as int,
          quizId: map["quizId"] as int,
        );
      }
    });
  }

  static Future<List<Map<String, Object?>>> getAnswers() async {
    final db = await AnswersDatabase.getInstance();
    return await db.query("answers");
  }

  static Future<List<Quiz>> getAvailableQuizzes(BuildContext context) async {
    final QuizStore quizStore = Provider.of<QuizStore>(context);
    final QuizDao mock = MockQuizDao();

    final quizzes = await mock.getQuestionnaries();
    final List<Quiz> returnList = [];
    for (Quiz quiz in quizzes) {
      if (!quizStore.answers.containsKey(quiz.id)) {
        returnList.add(quiz);
      }
    }
    return Future.value(returnList);
  }

  static Future<List<Quiz>> getAlreadyDoneQuizzes() async {
    final QuizDao mock = MockQuizDao();
    await mock.getQuestionnaries();

    List<Quiz> quizzes = [];
    for (Quiz quiz in QuizDao.quizzes) {
      final answers = await DatabaseDAO.getAnswers();
      int? lastQuizId;
      for (Map<String, Object?> element in answers) {
        if (lastQuizId != quiz.id && element["quizId"] == quiz.id) {
          lastQuizId = quiz.id;
          quizzes.add(quiz);
        }
      }
    }
    return Future.value(quizzes);
  }
}
