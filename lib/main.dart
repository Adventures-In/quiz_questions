import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_questions/actions/tap_my_quizzes_action.dart';
import 'package:quiz_questions/middleware/tap_my_quizzes_middleware.dart';
import 'package:quiz_questions/models/quiz.dart';
import 'package:quiz_questions/models/quiz_designer_v_m.dart';
import 'package:quiz_questions/pages/new_quiz_page_data_transforms.dart';
import 'package:quiz_questions/views/quiz_designer_view.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState(
      {

      /// RedFire AppState members
      required AuthState auth,
      @PageDataConverter() required IList<PageData> pages,
      required IList<ProblemInfo> problems,
      required Settings settings,
      ProfileData? profile,

      /// Additional AppState members
      required QuizDesignerVM quizDesigner}) = _AppState;

  factory AppState.init() => AppState(

      /// RedFire init code
      auth: AuthState.init(),
      pages: IList<PageData>([InitialPageData()]),
      problems: IList(),
      settings: Settings.init(),

      /// Additional init code
      quizDesigner: QuizDesignerVM(quizzes: <Quiz>[].lock));

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, QuizDesignerVM>(
        distinct: true,
        onInit: (store) => store.dispatch(TapMyQuizzesAction()),
        converter: (store) => store.state.quizDesigner,
        builder: (context, quizDesigner) {
          return Row(
            children: [
              Container(width: 200, color: const Color(0xFFFF0000)),
              const Expanded(child: QuizDesignerView()),
              Container(width: 200, color: const Color(0xFF0000FF))
            ],
          );
          // const Center(child: Text('MainPage'));
        });
  }
}

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: [TapMyQuizzesMiddleware()],
      reducers: const [],
      title: 'Quiz Questions',
      mainPage: const MainPage(),
      pageTransforms: [NewQuizPageDataTransforms()],
    ));
