import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_questions/models/quiz.dart';
import 'package:redfire/types.dart';

part 'select_quiz_action.freezed.dart';
part 'select_quiz_action.g.dart';

@freezed
class SelectQuizAction with _$SelectQuizAction, ReduxAction {
  factory SelectQuizAction(Quiz? quiz) = _SelectQuizAction;

  factory SelectQuizAction.fromJson(Map<String, Object?> json) =>
      _$SelectQuizActionFromJson(json);
}
