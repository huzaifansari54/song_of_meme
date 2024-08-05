import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/create_song_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/bloc/genarative/state/state.dart';

import '../../../../../lc.dart';

final chatBloc =
    StateNotifierProvider<ChatBotBloc, ChatRespone>((_) => ChatBotBloc(lc()));

class ChatBotBloc extends StateNotifier<ChatRespone> {
  ChatBotBloc(this._createSongUseCase) : super(ChatRespone.init());
  final CreateSongUseCase _createSongUseCase;
  setMessage(String msg) => state = state.copyWith(messaage: msg);

  chatRespons(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final resultOrFailure =
        await _createSongUseCase(param: CreateSongParm(lyrics: state.messaage))
            .run();

    resultOrFailure.match((failure) {
      state = state.copyWith(failure: failure, isLoading: false);
      showError(failure, context);
    }, (song) {
      final response = ChatRespone.fromBot(song: song, userMsg: state.messaage);
      state = response;
    });
  }
}
