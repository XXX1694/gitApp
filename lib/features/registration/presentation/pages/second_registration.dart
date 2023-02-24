import 'package:fit_app/common/constants.dart';
import 'package:fit_app/common/widgets/custom_app_bar.dart';
import 'package:fit_app/common/widgets/main_button.dart';
import 'package:fit_app/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:fit_app/features/registration/presentation/widgets/date_birth_field.dart';
import 'package:fit_app/features/registration/presentation/widgets/email_field.dart';
import 'package:fit_app/features/registration/presentation/widgets/first_name_field.dart';
import 'package:fit_app/features/registration/presentation/widgets/last_name_field.dart';
import 'package:fit_app/features/registration/presentation/widgets/phone_number_field.dart';
import 'package:fit_app/features/registration/presentation/widgets/sex_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondRegistrationPage extends StatefulWidget {
  const SecondRegistrationPage({super.key});

  @override
  State<SecondRegistrationPage> createState() => _SecondRegistrationPageState();
}

late TextEditingController _firstNameController;
late TextEditingController _lastNameController;
late TextEditingController _birthDateController;
late TextEditingController _sexController;
late TextEditingController _phoneNumberController;
late TextEditingController _emailController;
late RegistrationBloc bloc;

class _SecondRegistrationPageState extends State<SecondRegistrationPage> {
  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _birthDateController = TextEditingController();
    _sexController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
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
                    FirstNameField(controller: _firstNameController),
                    const SizedBox(height: 20),
                    LastNameField(controller: _lastNameController),
                    const SizedBox(height: 20),
                    CustomDatePicker(controller: _birthDateController),
                    const SizedBox(height: 20),
                    CustomDropDown(controller: _sexController),
                    const SizedBox(height: 20),
                    CustomPhoneFiled(controller: _phoneNumberController),
                    const SizedBox(height: 20),
                    EmailField(controller: _emailController),
                    const Spacer(),
                    MainButton(
                      txt: AppLocalizations.of(context)!.create,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) {},
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _sexController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
