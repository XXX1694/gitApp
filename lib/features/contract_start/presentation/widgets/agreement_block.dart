import 'package:fit_app/common/theme/colors.dart';
import 'package:fit_app/features/contract_start/presentation/widgets/custom_radio_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgreementBlock extends StatelessWidget {
  const AgreementBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomRadioButton(),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.i_confirm,
                      style: TextStyle(
                        letterSpacing: -0.38,
                        fontSize: 13,
                        color: defaultTextColor100,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: AppLocalizations.of(context)!.rules,
                      style: const TextStyle(
                        letterSpacing: -0.38,
                        fontSize: 13,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed('/rules');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomRadioButton(),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.i_agree,
                      style: TextStyle(
                        letterSpacing: -0.38,
                        fontSize: 13,
                        color: defaultTextColor100,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: AppLocalizations.of(context)!.agreement,
                      style: const TextStyle(
                        letterSpacing: -0.38,
                        fontSize: 13,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed('/agreement');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
