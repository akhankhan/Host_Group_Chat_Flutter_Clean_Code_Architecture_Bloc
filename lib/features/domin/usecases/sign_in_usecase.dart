import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> signIn(UserEntity user) async {
    return await repository.signIn(user);
  }
}
