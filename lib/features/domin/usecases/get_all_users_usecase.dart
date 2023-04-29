import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class GetAllUserUseCase {
  final FirebaseRepository repository;

  GetAllUserUseCase({required this.repository});

  Stream<List<UserEntity>> call() {
    return repository.getAllUsers();
  }
}
