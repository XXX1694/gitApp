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
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Text(' '),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/registration/first');
          },
          child: Text(
            AppLocalizations.of(context)!.sign_up,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
