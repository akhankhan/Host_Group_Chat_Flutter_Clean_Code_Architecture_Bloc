import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class GetUpdateUserUseCase {
  final FirebaseRepository repository;

  GetUpdateUserUseCase({required this.repository});

  Future<void> getUpdateUserUseCase(UserEntity user) {
    return repository.getUpdateUser(user);
  }
}
