import 'package:fpdart/src/task_either.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/is_user_login_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/repository/repository.dart';

class GetAllSongsUseCase extends UseCase<NoParm, List<SongEntity>> {
  final ISongOfMemeRepository _repository;

  GetAllSongsUseCase({required ISongOfMemeRepository repository})
      : _repository = repository;
  @override
  TaskEither<ApiFailure, List<SongEntity>> call({required NoParm param}) {
    return _repository.getAllSong();
  }
}
