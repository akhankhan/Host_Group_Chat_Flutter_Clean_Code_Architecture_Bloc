import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:host_group_chat/features/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:host_group_chat/features/presentation/cubit/credentail/cubit/credential_cubit.dart';
import 'package:host_group_chat/features/presentation/cubit/user/user_cubit.dart';
import 'package:host_group_chat/features/presentation/pages/home_page.dart';
import 'package:host_group_chat/features/presentation/pages/login_page.dart';
import 'package:host_group_chat/routes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Group Chat',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: Routes.route,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is AuthenticatedState) {
                  return HomePage(uid: authState.uid);
                } else {
                  return const LoginPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
