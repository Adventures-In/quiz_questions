import 'package:flutter/material.dart';
import 'package:quiz_questions/actions/create_quiz_action.dart';
import 'package:quiz_questions/main.dart';
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
      title: const Text('Enter a name'),
      content: (creating)
          ? const WaitingIndicator('creating')
          : SingleChildScrollView(
              child: TextField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Here...',
                  ),
                  onChanged: (text) => setState(() => name = text))),
      actions: <Widget>[
        OutlinedButton(
            onPressed: () {
              context.dispatch<AppState>(RemoveCurrentPageAction());
            },
            child: const Text('Cancel')),
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
