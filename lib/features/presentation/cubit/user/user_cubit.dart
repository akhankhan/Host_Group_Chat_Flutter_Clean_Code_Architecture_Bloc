import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/domin/usecases/get_all_users_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/get_update_user_usercase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUserUseCase getAllUserUseCase;
  final GetUpdateUserUseCase getUpdateUserUseCase;
  UserCubit(
      {required this.getAllUserUseCase, required this.getUpdateUserUseCase})
      : super(UserInitial());

  Future<void> getUsers() async {
    try {
      getAllUserUseCase.call().listen((listUsers) {
        emit(UserLoaded(users: listUsers));
      });
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> updateUser({required UserEntity user}) async {
    try {
      getUpdateUserUseCase.getUpdateUserUseCase(user);
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
