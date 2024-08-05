import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:song_of_meme/src/core/constant/colors_const.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/core/widget/loading.dart';
import 'package:song_of_meme/src/features/auth/view/widget/custome_widget.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/bloc/genarative/chat_bot_bloc.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/bloc/genarative/state/state.dart';

class SongCreationScreen extends ConsumerWidget {
  const SongCreationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final chatSate = ref.watch(chatBloc);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        chatSate.isLoading ? const Loading() : 0.sw,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: OutlinedButton(
                    onPressed: () {}, child: "CreateSong".text()),
              ),
              Center(
                child: OutlinedButton(
                    onPressed: () {}, child: "CreateCustomSong".text()),
              ),
              Center(
                child: OutlinedButton(onPressed: () {}, child: "Clone".text()),
              ),
            ],
          ),
        ),
        "Create Song Coming soon".text(size: 25),
        Spacer(),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .85,
              child: CustomField(
                  email: TextEditingController(),
                  hint: "create song",
                  onChange: (x) {}),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: lightBlackColor),
                child: IconButton(
                  onPressed: () {
                    ref.read(chatBloc.notifier).chatRespons(context);
                  },
                  icon: Icon(Icons.send),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
