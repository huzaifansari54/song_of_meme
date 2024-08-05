import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:song_of_meme/src/core/constant/colors_const.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/core/widget/error_widget.dart';
import 'package:song_of_meme/src/core/widget/loading.dart';
import 'package:song_of_meme/src/core/widget/succes.dart';
import 'package:song_of_meme/src/features/auth/view/bloc/auth_bloc.dart';
import 'package:song_of_meme/src/features/auth/view/widget/custome_widget.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/bloc/songs_bloc.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/screen/song_player_screen.dart';

class AllSongsScreen extends ConsumerStatefulWidget {
  const AllSongsScreen({super.key});

  @override
  ConsumerState<AllSongsScreen> createState() => _AllSongsScreenState();
}

class _AllSongsScreenState extends ConsumerState<AllSongsScreen> {
  late final TextEditingController _search;

  @override
  void initState() {
    _search = TextEditingController();
    Future.delayed(Duration.zero, () {
      ref.read(songsBloc.notifier).getAllSongs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authBloc);
    final allSongs =
        ref.watch(songsBloc.select((selector) => selector.allSongOrFailure));
    final isLoading =
        ref.watch(songsBloc.select((selector) => selector.isLoading));
    final songState = ref.watch(songsBloc);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            20.sh,
            Row(
              children: [
                20.sw,
                "Hello".text(size: 25),
                10.sw,
                auth.authModel.name.text(
                    size: 16, color: gray2, fontWeight: FontWeight.normal),
              ],
            ),
            "AllSongs".text(size: 25),
            20.sh,
            CustomField(
                onSearch: () {
                  ref.read(songsBloc.notifier).getSongById(context);
                },
                email: _search,
                hint: "search song by id",
                onChange: (query) {
                  ref.read(songsBloc.notifier).setQuery(query);
                }),
            20.sh,
            isLoading
                ? const Loading()
                : allSongs.match(
                    (failure) => FailureWidget(failure: failure),
                    (result) => Success(
                        data: result,
                        childBuilder: (_, index) {
                          final song = result[index];
                          return LayoutBuilder(builder: (context, constrant) {
                            final sizeOfParent = constrant.maxWidth;
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(songsBloc.notifier)
                                    .view(num.tryParse(song.song_id) ?? 0);
                                context.goTo(SongPlayerScreen(
                                  songEntity: song,
                                ));
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: lightBlackColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          "Titile: ${song.song_name}"
                                              .text(size: 18),
                                          SizedBox(
                                            width: sizeOfParent * .7,
                                            child: "Lyrics: ${song.lyrics}"
                                                .text(
                                                    color: greyColor, size: 10),
                                          ),
                                          10.sh,
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: warningPrimary,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      if (songState.isUserLike[
                                                              num.tryParse(song
                                                                      .song_id) ??
                                                                  0] ??
                                                          false) {
                                                        ref
                                                            .read(songsBloc
                                                                .notifier)
                                                            .dislike(
                                                                num.tryParse(song
                                                                        .song_id) ??
                                                                    0);
                                                      } else {
                                                        ref
                                                            .read(songsBloc
                                                                .notifier)
                                                            .like(num.tryParse(song
                                                                    .song_id) ??
                                                                0);
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            size: 15,
                                                            songState.isUserLike[
                                                                        num.tryParse(song.song_id) ??
                                                                            0] ??
                                                                    false
                                                                ? Icons
                                                                    .thumb_down
                                                                : Icons
                                                                    .thumb_up_off_alt_outlined),
                                                        5.sw,
                                                        songState.likeCount[
                                                                num.tryParse(song
                                                                        .song_id) ??
                                                                    0]
                                                            .toString()
                                                            .text()
                                                      ],
                                                    )),
                                                10.sw,
                                                GestureDetector(
                                                    onTap: () {},
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                            size: 15,
                                                            Icons.visibility),
                                                        5.sw,
                                                        song.views.text()
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          height: 100,
                                          song.image_url,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  error.toString().text(),
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          });
                        },
                        noData: "No Songs Available")),
          ],
        ),
      ),
    );
  }
}
