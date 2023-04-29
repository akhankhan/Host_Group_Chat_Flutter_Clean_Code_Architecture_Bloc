import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:host_group_chat/features/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:host_group_chat/features/data/remote_data_source/firebase_remote_data_source_imp.dart';
import 'package:host_group_chat/features/data/repositories/firebase_repository_impl.dart';
import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';
import 'package:host_group_chat/features/domin/usecases/forgot_password_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/get_all_users_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/get_create_current_user_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/get_current_user_id.dart';
import 'package:host_group_chat/features/domin/usecases/get_update_user_usercase.dart';
import 'package:host_group_chat/features/domin/usecases/google_auth_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/is_sign_in_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/sign__up_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/sign_in_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/sign_out_usecase.dart';
import 'package:host_group_chat/features/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:host_group_chat/features/presentation/cubit/credentail/cubit/credential_cubit.dart';
import 'package:host_group_chat/features/presentation/cubit/user/user_cubit.dart';

//sl -> service locater
final sl = GetIt.instance;

Future<void> init() async {
  //bloc,cubit
  sl.registerFactory<AuthCubit>(
    //get new instance
    () => AuthCubit(
      isSignInUseCase: sl.call(),
      getCurrentUserIdUseCase: sl.call(),
      signOutUseCase: sl.call(),
    ),
  );

  sl.registerFactory<UserCubit>(
    //get new instance
    () => UserCubit(
      getAllUserUseCase: sl.call(),
      getUpdateUserUseCase: sl.call(),
    ),
  );

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
        signInUseCase: sl.call(),
        signUpUseCase: sl.call(),
        forgotPasswordUseCase: sl.call(),
        getCreateCurrentUserUseCase: sl.call(),
        googleAuthUseCase: sl.call(),
      ));

  //Usecase
  //AuthCubit UseCase

  sl.registerLazySingleton<GetCurrentUserIdUseCase>(
      () => GetCurrentUserIdUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));

  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));

  //CredentialCubit UseCase
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetUpdateUserUseCase>(
      () => GetUpdateUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetAllUserUseCase>(
      () => GetAllUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(repository: sl.call()));

  //Repository

  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  //Remote datasource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(
            firestore: sl.call(),
            auth: sl.call(),
            googleSignIn: sl.call(),
          ));

  //Local source

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSigIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSigIn);
}
