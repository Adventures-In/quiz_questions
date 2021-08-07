import 'package:quiz_questions/actions/create_quiz_action.dart';
import 'package:quiz_questions/models/app_state.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

class CreateQuizMiddleware extends TypedMiddleware<AppState, CreateQuizAction> {
  CreateQuizMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getDatabaseService();
            await service.createDocumentAt(path: 'quizzes', jsonData: {
              'ownerId': store.state.auth.userData?.uid,
              'name': action.name
            });
            store.dispatch(RemoveCurrentPageAction());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
