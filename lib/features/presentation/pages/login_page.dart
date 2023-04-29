import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:host_group_chat/constant.dart';
import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:host_group_chat/features/presentation/cubit/credentail/cubit/credential_cubit.dart';
import 'package:host_group_chat/features/presentation/pages/home_page.dart';
import 'package:host_group_chat/features/presentation/widgets/button_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/header_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/row_text_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/textfield_container_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/textfield_password_container_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/theme/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentailState) {
          // TODO: implement listener

          if (credentailState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }

          if (credentailState is CredentialFailure) {
            //fix snakbar
            log('Invalid Email Password: ');
          }
        },
        builder: (context, credentailState) {
          if (credentailState is CredentialLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (credentailState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authSate) {
              if (authSate is AuthenticatedState) {
                return HomePage(
                  uid: authSate.uid,
                );
              } else {
                return _bodyWidget(context);
              }
            });
          }

          return _bodyWidget(context);
        },
      ),
    );
  }

  SingleChildScrollView _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            HeaderWidget(title: "Login"),
            TextFieldContainerWidget(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              prefixIcon: Icons.email,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldPasswordContainerWidget(
              keyboardType: TextInputType.emailAddress,
              controller: _passwordController,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(
              height: 10,
            ),
            _forgotPasswordWidget(),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              title: "Login",
              onTap: _submitSignIn,
            ),
            const SizedBox(
              height: 10,
            ),
            RowTextWidget(
              title1: "Don't have an account? ",
              title2: "Register",
              onTap: () {
                Navigator.pushNamed(context, PageConst.registerPage);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            _rowGoogleWidget(),
          ],
        ),
      ),
    );
  }

  Widget _forgotPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Text(""),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageConst.forgotPasswordPage);
          },
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: greenColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }

  Widget _rowGoogleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<CredentialCubit>(context).submitGoogleAuth();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Icon(
              AntDesign.google,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void _submitSignIn() {
    if (_emailController.text.isEmpty) {
      //
      Fluttertoast.showToast(
          msg: "Enter your email",
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (_passwordController.text.isEmpty) {
      //
      Fluttertoast.showToast(
          msg: "Enter your password",
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignIn(
      user: UserEntity(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
