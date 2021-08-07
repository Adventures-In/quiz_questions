import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quiz_questions/actions/tap_my_quizzes_action.dart';
import 'package:quiz_questions/models/app_state.dart';
import 'package:quiz_questions/models/quiz_designer_v_m.dart';
import 'package:quiz_questions/views/quiz_designer_view.dart';

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
