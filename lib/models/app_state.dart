import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_questions/models/quiz.dart';
import 'package:quiz_questions/models/quiz_designer_v_m.dart';
import 'package:redfire/types.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

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
      quizDesigner: QuizDesignerVM(quizzesList: <Quiz>[].lock));

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}
