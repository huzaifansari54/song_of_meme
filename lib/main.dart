import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';
import 'package:song_of_meme/src/features/auth/view/bloc/auth_bloc.dart';
import 'package:song_of_meme/src/features/auth/view/screen/loginScreen.dart';
import 'package:song_of_meme/src/features/auth/view/screen/signUpScreen.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/screen/all_songs_screen.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/screen/song_creation_screen.dart';
import 'package:song_of_meme/src/lc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MiddelWare());
  }
}

class MiddelWare extends ConsumerWidget {
  const MiddelWare({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isLogin = ref.watch(authBloc.select((selector) => selector.isLogin));
    final user = ref.watch(authBloc.select((selector) => selector.authModel));
    return isLogin
        ? HomeScree(
            user: user,
          )
        : const SingUpScreen();
  }
}

class HomeScree extends StatefulWidget {
  const HomeScree({super.key, required this.user});
  final AuthModel user;

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [AllSongsScreen(), SongCreationScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "All"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Creation")
      ]),
    );
  }
}
