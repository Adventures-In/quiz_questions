import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quiz_questions/actions/select_quiz_action.dart';
import 'package:quiz_questions/models/quiz.dart';
import 'package:quiz_questions/models/quiz_designer_v_m.dart';
import 'package:quiz_questions/pages/new_quiz_page_data.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';

import '../main.dart';

class QuizDesignerView extends StatelessWidget {
  const QuizDesignerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, QuizDesignerVM>(
        distinct: true,
        converter: (store) => store.state.quizDesigner,
        builder: (context, quizDesigner) {
          final addNewItem = Quiz(id: '', name: 'Add New', questions: []);
          return Scaffold(
              body: DropdownButton<Quiz>(
            isExpanded: true,
            value: quizDesigner.selectedQuiz,
            hint: const Text('Tap to select or create'),
            items: quizDesigner.quizzesList
                .add(addNewItem)
                .map((quiz) => DropdownMenuItem(
                      value: quiz,
                      child: Text(quiz.name),
                    ))
                .toList(),
            onChanged: (selection) => (selection == addNewItem)
                ? context.dispatch<AppState>(PushPageAction(NewQuizPageData()))
                : context.dispatch<AppState>(SelectQuizAction(selection)),
          ));
        });
  }
}
