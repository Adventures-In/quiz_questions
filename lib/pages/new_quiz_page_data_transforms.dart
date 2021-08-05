import 'package:flutter/material.dart';
import 'package:quiz_questions/pages/new_quiz_page.dart';
import 'package:quiz_questions/pages/new_quiz_page_data.dart';
import 'package:redfire/types.dart';

class NewQuizPageDataTransforms extends PageDataTransforms {
  NewQuizPageDataTransforms()
      : super(
            NewQuizPageData,
            (pageData) => const MaterialPage<NewQuizPage>(
                key: ValueKey(NewQuizPage), child: NewQuizPage()),
            (json) => NewQuizPageData.fromJson(json));
}
