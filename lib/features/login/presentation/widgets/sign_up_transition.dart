import 'package:fit_app/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpTransition extends StatelessWidget {
  const SignUpTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.have_an_account,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const Text(' '),
        Text(
          AppLocalizations.of(context)!.sign_up,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
