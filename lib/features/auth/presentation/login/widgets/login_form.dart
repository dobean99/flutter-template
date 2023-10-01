import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutx/flutx.dart';

import '../../../../../config/config.dart';
import '../../../application/application.dart';
import '../../../data/dtos/dtos.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  late OutlineInputBorder outlineInputBorder;
  late OutlineInputBorder errorInputBorder;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    outlineInputBorder =
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)));
    errorInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Colors.red));
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().onLogin(LoginPayloadDto(
          email: _emailController.text, password: _passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.bodyMedium(
            'Email',
            color: Colors.black,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: TextFormField(
                  style: FxTextStyle.bodyMedium(color: Colors.black),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    isDense: true,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    border: outlineInputBorder,
                    errorBorder: errorInputBorder,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.all(14),
                    hintText: 'Enter your email address',
                  ),
                  controller: _emailController,
                  validator: (value) {
                    return _formFieldValidator('email', value);
                  })),
          FxSpacing.height(24),
          FxText.bodyMedium(
            'Password',
            color: Colors.black,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: TextFormField(
                  style: FxTextStyle.bodyMedium(color: Colors.black),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    isDense: true,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    border: outlineInputBorder,
                    errorBorder: errorInputBorder,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.all(14),
                    hintText: 'Enter your password',
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    return _formFieldValidator('password', value);
                  })),
          FxSpacing.height(24),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 32,
            onPressed: _onLogin,
            backgroundColor: CustomTheme.actionPrimary,
            child: FxText.bodyMedium(
              'Log in',
              fontWeight: 700,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              color: Colors.white,
              letterSpacing: 0.4,
              height: 48,
            ),
          ),
        ],
      ),
    );
  }

  String? _formFieldValidator(String type, String? value) {
    if (type == 'email' && (value == null || value.isEmpty)) {
      return 'Email is required';
    }
    if (type == 'password') {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      } else if (value.length < 6) {
        return 'Password too short';
      }
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
