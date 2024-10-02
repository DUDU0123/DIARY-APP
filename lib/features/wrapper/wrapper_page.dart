import 'dart:developer';
import 'package:diary_app/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:diary_app/features/authentication/presentation/pages/login/login_page.dart';
import 'package:diary_app/features/diary_home/presentation/pages/diary_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  @override
  void initState() {
    context.read<AuthenticationBloc>().add(CheckUserLoggedInEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        log(state.toString());
        if (state is AuthenticationInitial) {
          if (state.isUserLoggedIn ?? false) {
            return const DiaryHomePage();
          } else {
            return const LoginPage();
          }
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
