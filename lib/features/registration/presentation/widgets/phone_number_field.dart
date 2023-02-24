import 'package:fit_app/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomPhoneFiled extends StatefulWidget {
  const CustomPhoneFiled({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CustomPhoneFiled> createState() => _CustomPhoneFiledState();
}

class _CustomPhoneFiledState extends State<CustomPhoneFiled> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: widget.controller,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: defaultTextColor100,
                ),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.phone_number,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            onChanged: (value) {
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter phone number';
              } else if (!RegExp(
                      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                  .hasMatch(value)) {
                return 'Enter valid phone number';
              }
              return null;
            },
            // focusNode: _loginFocus,
            // autofocus: true,
            // onFieldSubmitted: ((_) {
            //   _fieldFocusChange(
            //     context,
            //     _loginFocus,
            //     _passFocus,
            //   );
            // }),
            // controller: _usernameController,
            keyboardType: TextInputType.phone,
          ),
        ),
      ),
    );
  }
}
