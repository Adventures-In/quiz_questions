// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      auth: AuthState.fromJson(json['auth'] as Map<String, dynamic>),
      pages: IList.fromJson(json['pages'],
          (value) => PageData.fromJson(value as Map<String, dynamic>)),
      problems: IList.fromJson(json['problems'],
          (value) => ProblemInfo.fromJson(value as Map<String, dynamic>)),
      settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : ProfileData.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'auth': instance.auth,
      'pages': instance.pages.toJson(
        (value) => value,
      ),
      'problems': instance.problems.toJson(
        (value) => value,
      ),
      'settings': instance.settings,
      'profile': instance.profile,
    };
