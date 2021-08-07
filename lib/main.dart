import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_questions/middleware/create_quiz_middleware.dart';
import 'package:quiz_questions/middleware/tap_my_quizzes_middleware.dart';
import 'package:quiz_questions/models/app_state.dart';
import 'package:quiz_questions/pages/main/main_page.dart';
import 'package:quiz_questions/pages/new_quiz/new_quiz_page_data_transforms.dart';
import 'package:quiz_questions/reducers/select_quiz_reducer.dart';
import 'package:quiz_questions/reducers/store_quizzes_reducer.dart';
import 'package:redfire/widgets.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: [TapMyQuizzesMiddleware(), CreateQuizMiddleware()],
      reducers: [StoreQuizzesReducer(), SelectQuizReducer()],
      title: 'Quiz Questions',
      mainPage: const MainPage(),
      pageTransforms: [NewQuizPageDataTransforms()],
    ));
