import 'package:fpdart/fpdart.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';

import '../../../../core/exeption/failure_model.dart';
import '../../../auth/domain/use_case/is_user_login_use_case.dart';
import '../entity/song_entity.dart';
import '../repository/repository.dart';

class LikeSongUseCase extends UseCase<LikeSongParam, String> {
  final ISongOfMemeRepository _repository;

  LikeSongUseCase({required ISongOfMemeRepository repository})
      : _repository = repository;
  @override
  TaskEither<ApiFailure, String> call({required LikeSongParam param}) {
    return _repository.like(songId: param.songId);
  }
}

final class LikeSongParam {
  final num songId;

  LikeSongParam({required this.songId});
}
