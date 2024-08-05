import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';
part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const AuthModel._();

  const factory AuthModel(
      {required String id,
      required String name,
      required String email,
      required String profile_url}) = _AuthModel;
  factory AuthModel.fromJson(Map<String, Object?> json) =>
      _$AuthModelFromJson(json);
  factory AuthModel.empty() =>
      const AuthModel(profile_url: "", id: "", name: "", email: "");
}

extension DAO on AuthModel {
  AuthEntity toEntity() =>
      AuthEntity(profileUrl: profile_url, id: id, name: name, email: email);
}
