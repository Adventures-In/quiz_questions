import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_questions/quiz/models/quiz.dart';
import 'package:redfire/types.dart';

part 'store_quizzes_action.freezed.dart';
part 'store_quizzes_action.g.dart';

@freezed
class StoreQuizzesAction with _$StoreQuizzesAction, ReduxAction {
  factory StoreQuizzesAction({required List<Quiz> data}) = _StoreQuizzesAction;

  factory StoreQuizzesAction.fromJson(Map<String, Object?> json) =>
      _$StoreQuizzesActionFromJson(json);
}
