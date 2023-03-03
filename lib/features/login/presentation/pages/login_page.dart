import 'package:fit_app/common/constants.dart';
import 'package:fit_app/common/theme/colors.dart';
import 'package:fit_app/common/widgets/main_button.dart';
import 'package:fit_app/features/login/presentation/bloc/auth_bloc.dart';
import 'package:fit_app/features/login/presentation/widgets/forgot_password.dart';
import 'package:fit_app/features/login/presentation/widgets/login_field.dart';
import 'package:fit_app/features/login/presentation/widgets/password_field.dart';
import 'package:fit_app/features/login/presentation/widgets/sign_up_transition.dart';
import 'package:fit_app/features/login/presentation/widgets/text_block.dart';
import 'package:fit_app/utils/bottom_sheet.dart';
import 'package:fit_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

late TextEditingController _loginController;
late TextEditingController _passwordController;
late AuthBloc bloc;

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    // bloc.add(GetUserStatus());
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) => BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is UserOffline) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: backgroundColor,
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: padding_horiontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    const TextBlock(),
                    const Spacer(flex: 2),
                    LoginField(controller: _loginController),
                    const SizedBox(height: 16),
                    PasswordField(controller: _passwordController),
                    const SizedBox(height: 12),
                    const ForgotPassword(),
                    const Spacer(flex: 3),
                    MainButton(
                      txt: AppLocalizations.of(context)!.enter,
                      onPressed: () {
                        bloc.add(
                          LogIn(
                            username: _loginController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    const SignUpTransition(),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      listener: (context, state) {
        if (state is UserOnline) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        } else if (state is UserLogError) {
          showCustomBottomSheet(
            context,
            Center(
              child: Text(state.message),
            ),
          );
        } else if (state is ConnectionError) {
          showCustomSnackBar(context, const Text('No internet connection'));
        }
      },
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
