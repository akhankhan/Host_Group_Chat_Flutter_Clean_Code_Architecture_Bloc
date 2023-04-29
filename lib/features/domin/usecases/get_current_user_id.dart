import 'package:host_group_chat/features/domin/respositories/firebase_repository.dart';

class GetCurrentUserIdUseCase {
  final FirebaseRepository repository;

  GetCurrentUserIdUseCase({required this.repository});

  Future<String> call() {
    //getCurrentUserId
    return repository.getCurrentUserId();
  }
}
