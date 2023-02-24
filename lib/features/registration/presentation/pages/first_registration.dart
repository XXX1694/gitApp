import 'package:fit_app/common/constants.dart';
import 'package:fit_app/common/widgets/custom_app_bar.dart';
import 'package:fit_app/common/widgets/main_button.dart';
import 'package:fit_app/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:fit_app/features/registration/presentation/widgets/login_field.dart';
import 'package:fit_app/features/registration/presentation/widgets/password_field.dart';
import 'package:fit_app/features/registration/presentation/widgets/repeat_password_field.dart';
import 'package:fit_app/utils/snack_bar.dart';
import 'package:fit_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstRegistrationPage extends StatefulWidget {
  const FirstRegistrationPage({super.key});

  @override
  State<FirstRegistrationPage> createState() => _FirstRegistrationPageState();
}

late TextEditingController _loginController;
late TextEditingController _passwordController;
late TextEditingController _repeatPasswordController;
late RegistrationBloc bloc;

class _FirstRegistrationPageState extends State<FirstRegistrationPage> {
  @override
  void initState() {
    bloc = BlocProvider.of<RegistrationBloc>(context);
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: AppLocalizations.of(context)!.create_acc),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: padding_horiontal),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    LoginField(controller: _loginController),
                    const SizedBox(height: 20),
                    PasswordField(controller: _passwordController),
                    const SizedBox(height: 20),
                    RepeatPasswordField(controller: _repeatPasswordController),
                    const Spacer(),
                    MainButton(
                      txt: AppLocalizations.of(context)!.create,
                      onPressed: () {
                        var validation = Validation().checkPassword(
                            _passwordController.text,
                            _repeatPasswordController.text);
                        if (_loginController.text == '') {
                          showCustomSnackBar(
                            context,
                            const Text('Login field is required'),
                          );
                        } else if (_passwordController.text == '') {
                          showCustomSnackBar(
                            context,
                            const Text('Password field is required'),
                          );
                        } else if (_repeatPasswordController.text == '') {
                          showCustomSnackBar(
                            context,
                            const Text('Password field is required'),
                          );
                        } else if (validation == 1) {
                          showCustomSnackBar(
                            context,
                            const Text('Passwords are not same'),
                          );
                        } else if (validation == 2) {
                          showCustomSnackBar(
                            context,
                            const Text(
                                'password should contain at least one upper case, one lower case, one digit (! @ # \$ & * ~ ), one Special character, 8 characters in length '),
                          );
                        }
                        if (validation == 3) {
                          bloc.add(
                            CreateUser(
                              username: _loginController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) {
        if (state is UserCreated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/registration/second', (route) => false);
        } else if (state is UserCreateError) {
          showCustomSnackBar(
            context,
            Text(state.message),
          );
        } else if (state is ConnectionError) {
          showCustomSnackBar(context, const Text('No internet connection'));
        } else {}
      },
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }
}
