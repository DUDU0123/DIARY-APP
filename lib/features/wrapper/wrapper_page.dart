import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
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

class _WrapperPageState extends State<WrapperPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(CheckUserLoggedInEvent());

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          if (state.isUserLoggedIn ?? false) {
            return const DiaryHomePage();
          } else {
            return const LoginPage();
          }
        } else {
          return Scaffold(
            backgroundColor: kPink,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.book,
                        size: 80,
                        color: Colors.pink[300],
                      ),
                    ),
                  ),
                  kHeight30,
                  FadeTransition(
                    opacity: _animation,
                    child: Text(
                      'My Diary',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[700],
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
