class RegisterValidateService {
  bool isEmailCorrect(String email) {
    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);

    return emailValid;
  }

  bool isUserNameCorrect(String userName) {
    bool userNameValid = RegExp(r"([A-Z]*[a-z]*[0-9]*[!@#$%^&*_+=-]*^.{1,20}$)")
        .hasMatch(userName);

    if (userNameValid && userName.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isPasswordsTheSame(String password, String reapeatPassword) {
    if (password == reapeatPassword) {
      return true;
    } else {
      return false;
    }
  }

  bool isPasswordCorrect(String password) {
    bool isPasswordCorrect =
        RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*_+=-]*^.{10,40}$)")
            .hasMatch(password);

    if (isPasswordCorrect) {
      return true;
    } else {
      return false;
    }
  }

  bool isAllInputsFull(
    String password,
    String email,
    String userName,
    String reapeatPassword,
  ) {
    bool isAllInputsFull = true;
    if (password.isEmpty) {
      isAllInputsFull = false;
    } else if (userName.isEmpty) {
      isAllInputsFull = false;
    } else if (email.isEmpty) {
      isAllInputsFull = false;
    } else if (reapeatPassword.isEmpty) {
      isAllInputsFull = false;
    }

    return isAllInputsFull;
  }

  bool canUserBeCreated(
    String email,
    String password,
    String userName,
    String repeatPassword,
  ) {
    bool canUserBeCreated = true;
    if (!isAllInputsFull(password, email, userName, repeatPassword) ||
        !isEmailCorrect(email) ||
        !isPasswordCorrect(password) ||
        !isUserNameCorrect(userName) ||
        !isPasswordsTheSame(password, repeatPassword)) {
      canUserBeCreated = false;
    }
    return canUserBeCreated;
  }
}
