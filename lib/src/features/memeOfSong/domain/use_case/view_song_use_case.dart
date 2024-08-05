import 'package:fpdart/fpdart.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import '../../../../core/exeption/failure_model.dart';
import '../repository/repository.dart';

class ViewSongUseCase extends UseCase<ViewSongParam, String> {
  final ISongOfMemeRepository _repository;

  ViewSongUseCase({required ISongOfMemeRepository repository})
      : _repository = repository;
  @override
  TaskEither<ApiFailure, String> call({required ViewSongParam param}) {
    return _repository.view(songId: param.songId);
  }
}

final class ViewSongParam {
  final num songId;

  ViewSongParam({required this.songId});
}
