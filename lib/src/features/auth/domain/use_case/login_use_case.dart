import 'package:fpdart/src/task_either.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';
import 'package:song_of_meme/src/features/auth/domain/repository/repository.dart';

class LoginUseCase extends UseCase<LoginParm, AuthEntity> {
  final IAuthRepository _repository;

  LoginUseCase({required IAuthRepository repository})
      : _repository = repository;
  @override
  TaskEither<ApiFailure, AuthEntity> call({required LoginParm param}) {
    return _repository.logIn(email: param.email, password: param.password);
  }
}

class LoginParm {
  final String password;
  final String email;

  LoginParm({required this.password, required this.email});
}
