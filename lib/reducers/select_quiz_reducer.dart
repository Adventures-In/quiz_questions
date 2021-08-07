import 'package:quiz_questions/actions/select_quiz_action.dart';
import 'package:quiz_questions/models/app_state.dart';
import 'package:redux/redux.dart';

class SelectQuizReducer extends TypedReducer<AppState, SelectQuizAction> {
  SelectQuizReducer()
      : super(
          (state, action) =>
              state.copyWith.quizDesigner(selectedQuiz: action.quiz),
        );
}
