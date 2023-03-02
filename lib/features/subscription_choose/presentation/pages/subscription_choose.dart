import 'package:fit_app/common/theme/colors.dart';
import 'package:fit_app/common/widgets/main_button.dart';
import 'package:fit_app/features/subscription_choose/presentation/bloc/subscription_choose_bloc.dart';
import 'package:fit_app/features/subscription_choose/presentation/widgets/subscription_app_bar.dart';
import 'package:fit_app/features/subscription_choose/presentation/widgets/subscription_corusel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscriptionChoosePage extends StatefulWidget {
  const SubscriptionChoosePage({super.key});

  @override
  State<SubscriptionChoosePage> createState() => _SubscriptionChoosePageState();
}

late TextEditingController _subscriptionController;
late SubscriptionChooseBloc bloc;

class _SubscriptionChoosePageState extends State<SubscriptionChoosePage> {
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SubscriptionChooseBloc>(context);
    _subscriptionController = TextEditingController();
    _subscriptionController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionChooseBloc, SubscriptionChooseState>(
      builder: (context, state) => Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset:
            false, // to prevent from overflowing of keyboard
        body: Column(
          children: [
            SubscriptionAppBar(
              title: AppLocalizations.of(context)!.select_contract,
            ), // Custom App Bar with back route to login page
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  SubscriptionCarousel(
                    controller: _subscriptionController,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MainButton(
                      txt: AppLocalizations.of(context)!.choose,
                      onPressed: () {
                        bloc.add(
                          SetSubscribtion(
                            subscriptionID:
                                int.parse(_subscriptionController.text),
                          ),
                        );
                        // Navigator.of(context).pushNamed('/contract_start');
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) {
        // if(state is){}
      },
    );
  }

  @override
  void dispose() {
    _subscriptionController.dispose();
    super.dispose();
  }
}
