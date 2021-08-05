import 'dart:async';

import 'package:quiz_questions/actions/store_quizzes_action.dart';
import 'package:quiz_questions/actions/tap_my_quizzes_action.dart';
import 'package:quiz_questions/models/quiz.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class TapMyQuizzesMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, TapMyQuizzesAction> {
  TapMyQuizzesMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            await _subscription?.cancel();
            if (action.turnOff) {
              // A turn-off action just returns after cancelling subscription.
              return;
            }

            // Tap the database at the appropriate location.
            final databaseService = RedFireLocator.getDatabaseService();
            final userId = store.state.auth.userData?.uid;
            final quizzesChanges = databaseService.tapCollection(
                at: 'quizzes', where: 'ownerId', isEqualTo: userId);

            // Direct the stream of quizzes to the store.
            _subscription = quizzesChanges.listen((event) {
              store.dispatch(StoreQuizzesAction(
                  data: event.map<Quiz>((e) => Quiz.fromJson(e)).toList()));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<List<JsonMap>>? _subscription;
}
