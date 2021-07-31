import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

part 'main.freezed.dart';
part 'main.g.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: const [],
      reducers: const [],
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
  }) = _AppState;

  factory AppState.init() => AppState(
        /// RedFire init code
        auth: AuthState.init(),
        pages: <PageData>[const InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Additional init code
      );

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('MainPage'));
  }
}
