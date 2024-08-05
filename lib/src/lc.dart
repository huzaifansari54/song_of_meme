import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:song_of_meme/src/features/auth/data/data_source/data_source_repository.dart';
import 'package:song_of_meme/src/features/auth/data/data_source/local/local_data_source.dart';
import 'package:song_of_meme/src/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:song_of_meme/src/features/auth/data/repository/repository.dart';
import 'package:song_of_meme/src/features/auth/domain/repository/repository.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/is_user_login_use_case.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/data_source/remote/i_song_of_meme_data_source.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/data_source/remote/song_of_mem_data_source.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/repository/repository.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/repository/repository.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/create_song_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/dislike_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/get_all_songs.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/get_song_by_id_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/like_song_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/view_song_use_case.dart';

const timoutDuration = Duration(seconds: 20);

const conectionTimeOut = Duration(seconds: 30);
final lc = GetIt.instance;
Future<void> setup() async {
  lc.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  lc.registerSingleton<Dio>(Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    validateStatus: (status) => status! < 500,
  )));

  await lc.isReady<SharedPreferences>();

  lc
    ..registerSingleton<IAuthDataSaurceRepository>(
        AuthRemoteDataSource(dio: lc()))
    ..registerSingleton<ILocalDataSorce>(LocalDataSource(db: lc()))
    ..registerSingleton<IAuthRepository>(
        AuthRepository(lc(), dataSaurceRepository: lc()))
    ..registerSingleton(SignUpUseCase(repository: lc()))
    ..registerSingleton(LoginUseCase(repository: lc()))
    ..registerSingleton(IsUserLogInUseCase(repository: lc()));

  // songofMeme
  lc
    ..registerSingleton<ISongOfMemeDataSource>(
        SongOfMemeDataSource(cleint: lc()))
    // ..registerSingleton<ILocalDataSorce>(LocalDataSource(db: lc()))
    ..registerSingleton<ISongOfMemeRepository>(
        SongOfMemeRepository(dataSource: lc()))
    ..registerSingleton(GetAllSongsUseCase(repository: lc()))
    ..registerSingleton(DislikeUseCase(repository: lc()))
    ..registerSingleton(LikeSongUseCase(repository: lc()))
    ..registerSingleton(GetSongByIdUseCase(repository: lc()))
    ..registerSingleton(CreateSongUseCase(repository: lc()))
    ..registerSingleton(ViewSongUseCase(repository: lc()));
  // ..registerSingleton(LoginUseCase(repository: lc()))
  // ..registerSingleton(IsUserLogInUseCase(repository: lc()));
}
