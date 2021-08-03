import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_my_quizzes_action.freezed.dart';
part 'tap_my_quizzes_action.g.dart';

@freezed
class TapMyQuizzesAction with _$TapMyQuizzesAction, ReduxAction {
  factory TapMyQuizzesAction({@Default(false) bool turnOff}) =
      _TapMyQuizzesAction;

  factory TapMyQuizzesAction.fromJson(Map<String, Object?> json) =>
      _$TapMyQuizzesActionFromJson(json);
}
