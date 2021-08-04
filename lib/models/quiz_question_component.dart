import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'quiz_question_component.freezed.dart';
part 'quiz_question_component.g.dart';

@freezed
class QuizQuestionComponent with _$QuizQuestionComponent, ReduxModel {
  factory QuizQuestionComponent({required String text}) =
      _QuizQuestionComponent;

  factory QuizQuestionComponent.fromJson(Map<String, Object?> json) =>
      _$QuizQuestionComponentFromJson(json);
}
