import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> getCreateCurrentUserUseCase(UserEntity user) {
    return repository.getCreateCurrentUser(user);
  }
}
