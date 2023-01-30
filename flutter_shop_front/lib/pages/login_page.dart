import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../persistant_storage/persistant_storage.dart';
import '../persistant_storage/storage_keys/storage_keys.dart';
import '../web_api/dto/email_password_dto.dart';
import '../web_api/dto/token_dto.dart';
import '../web_api/services/login_connection_service.dart';
import '../widgets/snackbar.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController textEditingController = TextEditingController();
  final CustomSnackBar snackbar = GetIt.I<CustomSnackBar>();
  final LoginConnectionService loginConnectionService = GetIt.I<LoginConnectionService>();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  String userInput = '';
  String email = '';
  String password = '';
  String hintText = 'podaj adres Email';
  String buttonText = 'Dalej';
  bool _isEmailEntered = false;
  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      userInput = textEditingController.value.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Witaj",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(
              width: 500,
              child: _isEmailEntered
                  ? PasswordLoginTextField(
                      textEditingController: textEditingController,
                      hintText: hintText,
                    )
                  : EmailLoginTextField(
                      textEditingController: textEditingController,
                      hintText: hintText,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    style: Theme.of(context).textTheme.displaySmall,
                    buttonText,
                  ),
                ),
                onPressed: () {
                  if (email.isEmpty && textEditingController.text != "") {
                    setState(() {
                      email = userInput;
                      buttonText = "Zaloguj";
                      hintText = "Podaj hasło";
                      _isEmailEntered = true;
                      textEditingController.clear();
                    });
                  } else if (email.isNotEmpty) {
                    password = userInput;
                    loginConnectionService
                        .login(
                      EmailPasswordDto(
                        email: email,
                        password: password,
                      ),
                    )
                        .then((TokenDto tokenDto) async {
                      persistentStorage.pushDataToStorage(
                        StorageKeys.apiToken,
                        tokenDto.token,
                      );
                      setState(() {
                        email = '';
                        password = '';
                        buttonText = "Dalej";
                        hintText = "podaj adres Email";
                        _isEmailEntered = false;
                        textEditingController.clear();
                      });

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                      );
                    }).catchError((error) {
                      if (error is Exception) {
                        setState(() {
                          email = '';
                          password = '';
                          buttonText = "Dalej";
                          hintText = "podaj adres Email";
                          _isEmailEntered = false;
                          textEditingController.clear();
                        });
                        snackbar.show(
                          context,
                          'Podany zostął nieprawidłowy adres email, lub hasło',
                        );
                      }
                    });
                  } else {
                    snackbar.show(
                      context,
                      'Email nie może być pusty',
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () => {Navigator.pushNamed(context, "/register")},
                child: const Text('Nie masz konta?'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EmailLoginTextField extends StatelessWidget {
  const EmailLoginTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.titleMedium,
      controller: textEditingController,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}

class PasswordLoginTextField extends StatefulWidget {
  const PasswordLoginTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;

  @override
  State<PasswordLoginTextField> createState() => _PasswordLoginTextFieldState();
}

class _PasswordLoginTextFieldState extends State<PasswordLoginTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.titleMedium,
      controller: widget.textEditingController,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
