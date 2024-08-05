import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/core/widget/loading.dart';
import 'package:song_of_meme/src/features/auth/view/screen/loginScreen.dart';

import '../../../../core/constant/colors_const.dart';
import '../bloc/auth_bloc.dart';
import '../widget/custome_widget.dart';

class SingUpScreen extends ConsumerStatefulWidget {
  const SingUpScreen({super.key});

  @override
  ConsumerState<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends ConsumerState<SingUpScreen> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;

  final _formState = GlobalKey<FormState>();
  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authSate = ref.watch(authBloc);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Form(
        key: _formState,
        child: SafeArea(
          child: Column(
            children: [
              20.sh,
              authSate.isLoading ? const Loading() : 0.sh,
              20.sh,
              "SignUp".text(),
              CustomField(
                email: _email,
                hint: "email",
                onChange: (String val) {
                  ref.read(authBloc.notifier).setEmail(val);
                },
              ),
              CustomField(
                email: _name,
                hint: "name",
                onChange: (String val) {
                  ref.read(authBloc.notifier).setName(val);
                },
              ),
              CustomField(
                email: _password,
                hint: "password",
                onChange: (String val) {
                  ref.read(authBloc.notifier).setPassword(val);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(authBloc.notifier).signUp(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: lightBlackColor),
                      child: "SignUp".text(),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        context.goTo(const LoginScreen());
                      },
                      child: "Login".text(color: redColor)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
