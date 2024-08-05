import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/model/song_model.dart';

import '../../../../../core/exeption/failure_model.dart';
import '../../../../../core/utlis/util.dart';

abstract interface class ISongOfMemeDataSource {
  Future<List<SongModel>> getAllSong();
  Future<SongModel> getSongById({required num songId});
  Future<SongModel> getUserSong({required num pageI});
  Future<SongModel> createSong({required String lyrics});
  Future<SongModel> createCustomeSong({required DataMap body});
  Future<String> like({required num songId});
  Future<String> disLike({required num songId});
  Future<String> view({required num songId});
  Future<SongModel> cloneSong(
      {required File file, required String prompt, required String lyrics});
}
