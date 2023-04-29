import 'package:host_group_chat/features/domin/entities/user_entity.dart';

abstract class FirebaseRepository {
  //Credential Section
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> forgotPassword(String email);
  Future<void> googleAuth();
  Future<void> getUpdateUser(UserEntity user);
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<String> getCurrentUserId();
  //FIXME: missing methods
  Stream<List<UserEntity>> getAllUsers();
}
