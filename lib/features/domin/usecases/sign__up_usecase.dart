import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> signUp(UserEntity user) {
    return repository.signUp(user);
  }
}
