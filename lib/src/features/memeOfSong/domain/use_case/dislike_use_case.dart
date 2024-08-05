import 'package:fpdart/fpdart.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import '../../../../core/exeption/failure_model.dart';
import '../repository/repository.dart';

class DislikeUseCase extends UseCase<DisLikeSongParam, String> {
  final ISongOfMemeRepository _repository;

  DislikeUseCase({required ISongOfMemeRepository repository})
      : _repository = repository;
  @override
  TaskEither<ApiFailure, String> call({required DisLikeSongParam param}) {
    return _repository.disLike(songId: param.songId);
  }
}

final class DisLikeSongParam {
  final num songId;

  DisLikeSongParam({required this.songId});
}
