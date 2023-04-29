import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _dobController.dispose();
    _genderController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
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
                return _bodyWidget();
              }
            });
          }

          return _bodyWidget();
        },
      ),
    );
  }

  SingleChildScrollView _bodyWidget() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            HeaderWidget(title: "Registration"),
            const SizedBox(
              height: 10,
            ),
            _profileWidget(),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainerWidget(
              keyboardType: TextInputType.text,
              prefixIcon: Icons.person,
              controller: _usernameController,
              hintText: "usrname",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainerWidget(
              keyboardType: TextInputType.text,
              prefixIcon: Icons.email,
              controller: _emailController,
              hintText: "email",
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              indent: 120,
              endIndent: 120,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldPasswordContainerWidget(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock,
              hintText: "password",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldPasswordContainerWidget(
              controller: _passwordAgainController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock,
              hintText: "password (Again)",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainerWidget(
              keyboardType: TextInputType.datetime,
              prefixIcon: Icons.email,
              controller: _dobController,
              hintText: "D.O.B",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainerWidget(
              keyboardType: TextInputType.text,
              prefixIcon: Icons.email,
              controller: _genderController,
              hintText: "gender",
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              title: 'Register',
              onTap: () {
                _submitSignUp();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            RowTextWidget(
              title1: "Do you have already an account?",
              title2: "Login",
              mainAxisAlignment: MainAxisAlignment.center,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, PageConst.loginPage, (route) => false);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            _rowDataWidget(),
          ],
        ),
      ),
    );
  }

  Widget _profileWidget() {
    return Column(
      children: [
        Container(
          height: 62,
          width: 62,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            "assets/profile_default.png",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "Add Profile",
          style: TextStyle(
            color: greenColor,
          ),
        )
      ],
    );
  }

  Widget _rowDataWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'By clicking register, you agree to the ',
          style: TextStyle(
            color: colorC1C1C1,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.green,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  void _submitSignUp() {
    if (_usernameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter your name",
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (_emailController.text.isEmpty) {
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

    if (_passwordController.text == _passwordAgainController.text) {
    } else {
      Fluttertoast.showToast(
          msg: "Both password must be same...",
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignUp(
        user: UserEntity(
      name: _usernameController.text,
      email: _emailController.text,
      password: _passwordAgainController.text,
      isOnline: false,
      status: "",
      profileUrl: "",
      phoneNumber: "",
      dob: _dobController.text.isEmpty ? "" : _dobController.text,
      gender: _genderController.text.isEmpty ? "" : _genderController.text,
    ));
  }
}
