import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_questions/quiz/actions/tap_my_quizzes_action.dart';
import 'package:quiz_questions/quiz/middleware/tap_my_quizzes_middleware.dart';
import 'package:quiz_questions/quiz/models/quiz.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

part 'main.freezed.dart';
part 'main.g.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: [TapMyQuizzesMiddleware()],
      reducers: const [],
      title: 'Quiz Questions',
      mainPage: const MainPage(),
    ));

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire AppState members
    required AuthState auth,
    required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    ProfileData? profile,

    /// Additional AppState members
    required IList<Quiz> quizzes,
  }) = _AppState;

  factory AppState.init() => AppState(
        /// RedFire init code
        auth: AuthState.init(),
        pages: <PageData>[const InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Additional init code
        quizzes: <Quiz>[].lock,
      );

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IList<Quiz>>(
        distinct: true,
        onInit: (store) => store.dispatch(TapMyQuizzesAction()),
        converter: (store) => store.state.quizzes,
        builder: (context, quizzes) {
          return const Center(child: Text('MainPage'));
        });
  }
}
