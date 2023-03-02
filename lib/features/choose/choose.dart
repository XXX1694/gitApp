import 'package:fit_app/common/theme/colors.dart';
import 'package:fit_app/features/choose/club_choose/presentation/pages/club_choose.dart';
import 'package:fit_app/features/choose/coach_choose/presentation/pages/coach_choose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

int? sliding = 0;

class _ChoosePageState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: deviceHeight * 0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.choose,
                          style: TextStyle(
                            color: defaultTextColor100,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            // letterSpacing: 0.38,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl(
                    backgroundColor: kPrimaryColor.withOpacity(0.12),
                    children: {
                      0: Text(
                        AppLocalizations.of(context)!.centers,
                        style: TextStyle(
                          fontSize: 13,
                          color: defaultTextColor100,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      1: Text(
                        AppLocalizations.of(context)!.coaches,
                        style: TextStyle(
                          fontSize: 13,
                          color: defaultTextColor100,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    },
                    onValueChanged: (int? value) => {
                      setState(
                        () {
                          sliding = value;
                        },
                      )
                    },
                    groupValue: sliding,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: sliding == 1
                  ? const CoachChooseBlock()
                  : const ClubChooseBlock(),
            ),
          ),
        ],
      ),
    );
  }
}
