abstract class LoginError implements Exception {
  late String message;

  @override
  String toString() {
    return message;
  }
}

class LoginRepositoryError extends LoginError {
  LoginRepositoryError(String message) {
    this.message = message;
  }
}