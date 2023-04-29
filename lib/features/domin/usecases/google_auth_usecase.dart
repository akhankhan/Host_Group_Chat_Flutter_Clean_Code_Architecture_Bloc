import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class GoogleAuthUseCase {
  final FirebaseRepository repository;

  GoogleAuthUseCase({required this.repository});

  Future<void> googleAuth() {
    return repository.googleAuth();
  }
}
