// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongModelImpl _$$SongModelImplFromJson(Map<String, dynamic> json) =>
    _$SongModelImpl(
      song_id: json['song_id'] as num,
      isUseLike: json['isUseLike'] as bool?,
      user_id: json['user_id'] as String,
      song_name: json['song_name'] as String,
      song_url: json['song_url'] as String,
      likes: json['likes'] as num,
      views: json['views'] as num,
      image_url: json['image_url'] as String,
      lyrics: json['lyrics'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      date_time: json['date_time'] as String,
    );

Map<String, dynamic> _$$SongModelImplToJson(_$SongModelImpl instance) =>
    <String, dynamic>{
      'song_id': instance.song_id,
      'isUseLike': instance.isUseLike,
      'user_id': instance.user_id,
      'song_name': instance.song_name,
      'song_url': instance.song_url,
      'likes': instance.likes,
      'views': instance.views,
      'image_url': instance.image_url,
      'lyrics': instance.lyrics,
      'tags': instance.tags,
      'date_time': instance.date_time,
    };
