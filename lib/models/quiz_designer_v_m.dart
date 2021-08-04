import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_questions/models/quiz.dart';
import 'package:redfire/types.dart';

part 'quiz_designer_v_m.freezed.dart';
part 'quiz_designer_v_m.g.dart';

@freezed
class QuizDesignerVM with _$QuizDesignerVM, ReduxModel {
  factory QuizDesignerVM({required IList<Quiz> quizzes, Quiz? selectedQuiz}) =
      _QuizDesignerVM;

  factory QuizDesignerVM.fromJson(Map<String, Object?> json) =>
      _$QuizDesignerVMFromJson(json);
}
