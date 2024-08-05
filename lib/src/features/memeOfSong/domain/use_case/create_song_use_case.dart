import 'package:fpdart/src/task_either.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/is_user_login_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/repository/repository.dart';

class CreateSongUseCase extends UseCase<CreateSongParm, SongEntity> {
  final ISongOfMemeRepository _repository;

  CreateSongUseCase({required ISongOfMemeRepository repository})
      : _repository = repository;

  @override
  TaskEither<ApiFailure, SongEntity> call({required CreateSongParm param}) {
    return _repository.createSong(lyrics: param.lyrics);
  }
}

class CreateSongParm {
  final String lyrics;

  CreateSongParm({required this.lyrics});
}
