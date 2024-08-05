import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:song_of_meme/src/core/constant/colors_const.dart';
import 'package:song_of_meme/src/features/auth/view/bloc/auth_bloc.dart';

import '../widget/custome_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;

  final _formState = GlobalKey<FormState>();
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Form(
        key: _formState,
        child: SafeArea(
          child: Column(
            children: [
              CustomField(
                email: _email,
                hint: "email",
                onChange: (String val) {
                  ref.read(authBloc.notifier).setEmail(val);
                },
              ),
              CustomField(
                email: _password,
                hint: "password",
                onChange: (String val) {
                  ref.read(authBloc.notifier).setPassword(val);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
