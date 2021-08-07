import 'package:quiz_questions/actions/store_quizzes_action.dart';
import 'package:quiz_questions/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreQuizzesReducer extends TypedReducer<AppState, StoreQuizzesAction> {
  StoreQuizzesReducer()
      : super(
          (state, action) =>
              state.copyWith.quizDesigner(quizzesList: action.data),
        );
}
