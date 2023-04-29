import 'package:host_group_chat/features/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> forgotPassword(String email) async =>
      remoteDataSource.forgotPassword(email);
  @override
  Future<void> getCreateCurrentUser(UserEntity user) =>
      remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUserId() async =>
      remoteDataSource.getCurrentUserId();

  @override
  Future<void> getUpdateUser(UserEntity user) async =>
      remoteDataSource.getUpdateUser(user);

  @override
  Future<void> googleAuth() async => remoteDataSource.googleAuth();

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async => remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();
}
