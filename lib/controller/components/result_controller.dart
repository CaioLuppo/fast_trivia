import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';

enum ResultInfo {
  message,
  color,
}

dynamic getResultInfo(ResultInfo info, QuizStore store) {
  List infos = [];

  if (store.percent > 0 && store.percent < 100) {
    infos.insert(ResultInfo.message.index, "Quase lá!");
    infos.insert(ResultInfo.color.index, TriviaColors.purple);
  } else if (store.percent == 0) {
    infos.insert(ResultInfo.message.index, "Oops! 🤔");
    infos.insert(ResultInfo.color.index, TriviaColors.red);
  } else {
    infos.insert(ResultInfo.message.index, "Parabéns!");
    infos.insert(ResultInfo.color.index, TriviaColors.green);
  }

  return infos[info.index];
}
