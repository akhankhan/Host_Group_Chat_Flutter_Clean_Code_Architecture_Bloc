import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class ForgotPasswordUseCase {
  final FirebaseRepository repository;

  ForgotPasswordUseCase({required this.repository});

  Future<void> forgotPassword(String email) {
    return repository.forgotPassword(email);
  }
}
