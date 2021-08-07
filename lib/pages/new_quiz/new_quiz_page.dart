import 'package:flutter/material.dart';
import 'package:quiz_questions/actions/create_quiz_action.dart';
import 'package:quiz_questions/models/app_state.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/widgets.dart';

class NewQuizPage extends StatefulWidget {
  const NewQuizPage({Key? key}) : super(key: key);

  @override
  State<NewQuizPage> createState() => _NewQuizPageState();
}

class _NewQuizPageState extends State<NewQuizPage> {
  bool creating = false;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: (creating) ? const Text('') : const Text('Enter a...'),
      content: (creating)
          ? const SingleChildScrollView(child: WaitingIndicator('creating'))
          : SingleChildScrollView(
              child: TextField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'name'),
                  onChanged: (text) => setState(() => name = text))),
      actions: <Widget>[
        if (!creating)
          OutlinedButton(
              onPressed: () {
                context.dispatch<AppState>(RemoveCurrentPageAction());
              },
              child: const Text('Cancel')),
        if (!creating)
          OutlinedButton(
              onPressed: () {
                context.dispatch<AppState>(CreateQuizAction(name: name));
                setState(() => creating = true);
              },
              child: const Text('Create')),
      ],
    );
  }
}
