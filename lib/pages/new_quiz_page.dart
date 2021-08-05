import 'package:flutter/material.dart';
import 'package:quiz_questions/main.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';

class NewQuizPage extends StatelessWidget {
  const NewQuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Quiz'),
      content: const SingleChildScrollView(child: TextField()),
      actions: [
        OutlinedButton(
            onPressed: () =>
                context.dispatch<AppState>(RemoveCurrentPageAction()),
            child: const Text('Dismiss'))
      ],
    );
  }
}
