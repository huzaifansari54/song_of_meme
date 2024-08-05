import 'package:fpdart/src/task_either.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';
import 'package:song_of_meme/src/features/auth/domain/repository/repository.dart';

class IsUserLogInUseCase extends UseCase<NoParm, AuthModel> {
  final IAuthRepository _repository;

  IsUserLogInUseCase({required IAuthRepository repository})
      : _repository = repository;

  @override
  TaskEither<ApiFailure, AuthModel> call({required NoParm param}) {
    return _repository.user().map((model) => model.toModel());
  }

  // Future<bool> call({required NoParm param}) {
  //   return _repository.user();
  // }
}

class NoParm {}
