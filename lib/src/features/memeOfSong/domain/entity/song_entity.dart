import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/model/song_model.dart';
part 'song_entity.freezed.dart';

@freezed
abstract class SongEntity with _$SongEntity {
  const factory SongEntity({
    required String song_id,
    required bool isUserLiked,
    required String user_id,
    required String song_name,
    required String song_url,
    required String likes,
    required String views,
    required String image_url,
    required String lyrics,
    required List<String> tags,
    required String date_time,
  }) = _SongEntity;
}

extension DOA on SongEntity {
  SongModel toMaodel() => SongModel(
      isUseLike: isUserLiked,
      song_id: num.tryParse(song_id) ?? 0,
      user_id: user_id,
      song_name: song_name,
      song_url: song_url,
      likes: num.tryParse(likes) ?? 0,
      views: num.tryParse(views) ?? 0,
      image_url: image_url,
      lyrics: lyrics,
      tags: tags,
      date_time: date_time);
}
            // "song_id": 206,
            // "user_id": "gopireddy.hariharasainathreddy@gmail.com",
            // "song_name": "Devara Fear Song",
            // "song_url": "https://soundofmeme.s3.amazonaws.com/fc10c6fa-d671-45d4-85eb-a403a3ead040.mp3",
            // "likes": 0,
            // "views": 1,
            // "image_url": "https://soundofmeme.s3.amazonaws.com/fc10c6fa-d671-45d4-85eb-a403a3ead040.jpeg",
            // "lyrics": "Agganattukundhi Sandhram\nBagunna Mande Aagraham\nArachakaalu Bagnam\nChallare Chedu Saahasam\n\nJagadapu Dhaarilo\nMundhadugainaa Senaani\nThalupulu Repaaga\nAlupunaa Aape Sainyaannee\n\nDhooke Dhairyama Jagratthaa\nRaake Egabadi Raake\nDevara Mungitaa Nuvventhaa\nDhakkove…\n\nKaalam Thadabadene\nPonge Keratam Laagene\nPranam Parugulaiyee\nKalugullo Dhoorene\n\nDhooke Dhairyama Jagratthaa\nAll Hail All Hail For Tiger\nDevara Mungitaa Nuvventhaa\nAll Hail\n\nDevara\n\nJagathiki Chetucheyyanelaa\nDevara Vetukandhadelaa\nManame Kadhamai Dhigithe Belabela\nKanulaku Kaanaraanidhilaa\nKadaliki Kaapaiyyindheevelaa\nVidhike Edhurai Velithe Vila Vilaa\n\nAlalaye Erupu Neellee\nAa Kallanu Kadigeraa\nPralayamai Athadhi Raake\nThala Thala Thala Thatoraa\n\nDevara Mouname\nSavarana Leni Heccharikaa\nRagilinaa Kopame\nMruthyuvukainaa Mucchemataa\n\nDhooke Dhairyama Jagratthaa\nRaake Egabadi Raake\nDevara Mungitaa Nuvventhaa\nDhakkove…\n\nPraanam Thadabadene\nPonge Keratam Laagene\nPranam Parugulaiyee\nParugullo Dhoorene\n\nDhooke Dhairyama Jagratthaa\nAll Hail All Hail For Tiger\nDevara Mungitaa Nuvventhaa\nAll Hail\n\nDevara\nDevara",
            // "tags": [
            //     "Reggae"
            // ],
            // "date_time": "2024-08-03 16:41:04"