import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_questions/quiz/models/quiz_question_component.dart';
import 'package:redfire/types.dart';

part 'quiz_question.freezed.dart';
part 'quiz_question.g.dart';

@freezed
class QuizQuestion with _$QuizQuestion, ReduxModel {
  factory QuizQuestion({required List<QuizQuestionComponent> components}) =
      _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, Object?> json) =>
      _$QuizQuestionFromJson(json);
}
