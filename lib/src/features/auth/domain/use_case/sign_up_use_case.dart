import 'package:fpdart/src/task_either.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';
import 'package:song_of_meme/src/features/auth/domain/repository/repository.dart';

class SignUpUseCase extends UseCase<SignUpParm, AuthEntity> {
  final IAuthRepository _repository;

  SignUpUseCase({required IAuthRepository repository})
      : _repository = repository;
  @override
  TaskEither<ApiFailure, AuthEntity> call({required SignUpParm param}) {
    return _repository.singUp(
        email: param.email, password: param.password, name: param.name);
  }
}

class SignUpParm {
  final String name;
  final String email;
  final String password;

  SignUpParm({required this.name, required this.email, required this.password});
}
