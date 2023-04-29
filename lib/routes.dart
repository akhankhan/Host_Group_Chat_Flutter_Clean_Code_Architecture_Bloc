import 'package:flutter/material.dart';
import 'package:host_group_chat/constant.dart';
import 'package:host_group_chat/features/presentation/pages/create_new_group_page.dart';
import 'package:host_group_chat/features/presentation/pages/forgot_password_page.dart';
import 'package:host_group_chat/features/presentation/pages/login_page.dart';
import 'package:host_group_chat/features/presentation/pages/register_page.dart';
import 'package:host_group_chat/features/presentation/pages/single_chat_page.dart';

class Routes {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.singleChatPage:
        {
          return materialBuilder(widget: const SingleChatPage());
        }
      case PageConst.createNewGroup:
        {
          return materialBuilder(widget: const CreateNewGroupPage());
        }

      case PageConst.forgotPasswordPage:
        {
          return materialBuilder(widget: const ForgotPasswordPage());
        }
      case PageConst.loginPage:
        {
          return materialBuilder(widget: const LoginPage());
        }
      case PageConst.registerPage:
        {
          return materialBuilder(widget: const RegisterPage());
        }
      case "/":
        {
          return materialBuilder(widget: const LoginPage());
        }

      default:
        return materialBuilder(widget: ErrorPage());
    }
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(
        child: Text('Error Page '),
      ),
    );
  }
}
