import 'package:fpdart/src/task_either.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/is_user_login_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/repository/repository.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/get_all_songs.dart';

class GetSongByIdUseCase extends UseCase<GetSongByIdParm, SongEntity> {
  final ISongOfMemeRepository _repository;

  GetSongByIdUseCase({required ISongOfMemeRepository repository})
      : _repository = repository;
  @override
  TaskEither<ApiFailure, SongEntity> call({required GetSongByIdParm param}) {
    return _repository.getSongById(songId: param.songId);
  }
}

final class GetSongByIdParm {
  final num songId;

  GetSongByIdParm({required this.songId});
}
