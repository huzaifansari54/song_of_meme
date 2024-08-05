import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/model/song_model.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';

import '../../../../../../core/exeption/failure_model.dart';
part 'state.freezed.dart';

@freezed
abstract class ChatRespone with _$ChatRespone {
  const ChatRespone._();
  const factory ChatRespone(
      {required bool isLoading,
      required ApiFailure? failure,
      required SongEntity? song,
      required String messaage}) = _ChatRespone;
  factory ChatRespone.init() => const ChatRespone(
      isLoading: false, failure: null, song: null, messaage: "");
  factory ChatRespone.fromBot(
          {required SongEntity song, required String userMsg}) =>
      ChatRespone(
          isLoading: false, failure: null, song: song, messaage: userMsg);
  bool get isBot => song != null;
}
