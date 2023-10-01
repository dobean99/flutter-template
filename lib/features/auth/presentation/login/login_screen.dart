import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutx/flutx.dart';

import '../../../../config/config.dart';
import '../../application/application.dart';
import 'widgets/login_form.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (_) => getIt<LoginCubit>(),
        child: Scaffold(
          body: ListView(
            padding: FxSpacing.fromLTRB(24, screenHeight * 0.2, 24, 0),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  PngAssets.logo,
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.3,
                  fit: BoxFit.contain,
                ),
              ),
              FxText.headlineLarge(
                'Log in',
                color: Colors.black,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              FxSpacing.height(screenHeight * 0.005),
              FxText.bodyMedium(
                'Use your organisation code & group code for \nlog-in',
                color: Colors.black,
                fontSize: 16,
                fontWeight: 400,
                height: 1.5,
              ),
              FxSpacing.height(screenHeight * 0.05),
              const LoginForm()
            ],
          ),
        ));
  }
}
