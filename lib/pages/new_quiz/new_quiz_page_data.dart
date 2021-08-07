import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'new_quiz_page_data.freezed.dart';
part 'new_quiz_page_data.g.dart';

@freezed
class NewQuizPageData extends PageData with _$NewQuizPageData, ReduxModel {
  factory NewQuizPageData() = _NewQuizPageData;

  factory NewQuizPageData.fromJson(Map<String, Object?> json) =>
      _$NewQuizPageDataFromJson(json);
}
