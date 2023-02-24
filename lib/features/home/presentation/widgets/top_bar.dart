import 'package:fit_app/common/constants.dart';
import 'package:fit_app/common/theme/colors.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: padding_horiontal),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hello, ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextSpan(
                    text: txt,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(default_border_radius),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
