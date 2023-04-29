import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class SignOutUseCase {
  final FirebaseRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> signOutUseCase() {
    return repository.signOut();
  }
}
