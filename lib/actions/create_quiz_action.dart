import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_quiz_action.freezed.dart';
part 'create_quiz_action.g.dart';

@freezed
class CreateQuizAction with _$CreateQuizAction, ReduxAction {
  factory CreateQuizAction() = _CreateQuizAction;

  factory CreateQuizAction.fromJson(Map<String, Object?> json) =>
      _$CreateQuizActionFromJson(json);
}
