import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';
import 'package:song_of_meme/src/features/auth/data/repository/repository.dart';
part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity(
      {required String id,
      required String name,
      required String email,
      required String profileUrl}) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, Object?> json) =>
      _$AuthEntityFromJson(json);
}

extension DAO on AuthEntity {
  AuthModel toModel() =>
      AuthModel(profile_url: profileUrl, id: id, name: name, email: email);
}
