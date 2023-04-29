import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class IsSignInUseCase {
  final FirebaseRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() {
    //isSignIn
    return repository.isSignIn();
  }
}
