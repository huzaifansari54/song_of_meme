import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';
part 'song_model.freezed.dart';
part 'song_model.g.dart';

@freezed
abstract class SongModel with _$SongModel {
  const factory SongModel({
    required num song_id,
    required bool? isUseLike,
    required String user_id,
    required String song_name,
    required String song_url,
    required num likes,
    required num views,
    required String image_url,
    required String lyrics,
    required List<String> tags,
    required String date_time,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, Object?> json) =>
      _$SongModelFromJson(json);
  // factory SongModel.empty() =>
  //     const AuthModel(profile_url: "", id: "", name: "", email: "");
}

extension DAO on SongModel {
  SongEntity toEntity() => SongEntity(
      isUserLiked: isUseLike ?? false,
      song_id: song_id.toString(),
      user_id: user_id,
      song_name: song_name,
      song_url: song_url,
      likes: likes.toString(),
      views: views.toString(),
      image_url: image_url,
      lyrics: lyrics,
      tags: tags,
      date_time: date_time);
}
