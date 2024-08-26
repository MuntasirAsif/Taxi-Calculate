class SignupEmailPasswordFailure {
  final String message;
  SignupEmailPasswordFailure([this.message = "An Unknown Error occurred"]);
  factory SignupEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignupEmailPasswordFailure('Please enter a strong password');
      case 'invalid-email':
        return SignupEmailPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return SignupEmailPasswordFailure(
            'An account already exists for that mail');
      case 'operation-not-allowed':
        return SignupEmailPasswordFailure(
            'Operation is not allowed. Please contact support');
      case 'user-disabled':
        return SignupEmailPasswordFailure(
            'This user has been disable. Please contact support for help');
      default:
        return SignupEmailPasswordFailure();
    }
  }
}
