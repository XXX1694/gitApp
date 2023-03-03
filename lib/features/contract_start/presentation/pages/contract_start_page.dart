import 'package:fit_app/common/constants.dart';
import 'package:fit_app/common/widgets/custom_app_bar.dart';
import 'package:fit_app/common/widgets/main_button.dart';
import 'package:fit_app/features/contract_start/presentation/widgets/agreement_block.dart';
import 'package:fit_app/features/contract_start/presentation/widgets/custom_date_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContractStartPage extends StatefulWidget {
  const ContractStartPage({super.key});

  @override
  State<ContractStartPage> createState() => _ContractStartPageState();
}

late TextEditingController _contractController;

class _ContractStartPageState extends State<ContractStartPage> {
  @override
  void initState() {
    _contractController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppLocalizations.of(context)!.contract_start),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: padding_horiontal),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomDatePicker(controller: _contractController),
                  const SizedBox(height: 20),
                  const AgreementBlock(),
                  const Spacer(),
                  MainButton(
                    txt: AppLocalizations.of(context)!.confirm,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _contractController.dispose();
    super.dispose();
  }
}
