import 'package:fit_app/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextBlock extends StatelessWidget {
  const TextBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.app_name_1,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              TextSpan(
                text: AppLocalizations.of(context)!.app_name_2,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: kPrimaryColor),
              ),
            ],
          ),
        ),
        Text(
          AppLocalizations.of(context)!.log_in_to_continue,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
