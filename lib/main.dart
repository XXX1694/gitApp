import 'package:fit_app/common/theme/light_theme.dart';
import 'package:fit_app/features/choose/choose.dart';
import 'package:fit_app/features/choose/club_choose/data/repositories/club_repository.dart';
import 'package:fit_app/features/choose/club_choose/presentation/bloc/club_choose_bloc.dart';
import 'package:fit_app/features/contract_start/presentation/pages/contract_start_page.dart';
import 'package:fit_app/features/contract_start/presentation/widgets/agreement_page.dart';
import 'package:fit_app/features/contract_start/presentation/widgets/rules_page.dart';
import 'package:fit_app/features/default_pages/not_working.dart';
import 'package:fit_app/features/login/data/repositories/user_auth_repository.dart';
import 'package:fit_app/features/login/presentation/bloc/auth_bloc.dart';
import 'package:fit_app/features/login/presentation/pages/login_page.dart';
import 'package:fit_app/features/main/presentation/pages/main_page.dart';
import 'package:fit_app/features/registration/data/repositories/registration_repository.dart';
import 'package:fit_app/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:fit_app/features/registration/presentation/pages/first_registration.dart';
import 'package:fit_app/features/registration/presentation/pages/second_registration.dart';
import 'package:fit_app/features/subscription_choose/data/repositories/subscription_repository.dart';
import 'package:fit_app/features/subscription_choose/presentation/bloc/subscription_choose_bloc.dart';
import 'package:fit_app/features/subscription_choose/presentation/pages/subscription_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// For building models: flutter pub run build_runner build --delete-conflicting-outputs
// For changing app icon: flutter pub run flutter_launcher_icons:main

void main() async {
  await dotenv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            repo: UserAuthRepository(),
            userState: const AuthState(),
          ),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(
            repo: RegistrationRepository(),
            registrationState: const RegistrationState(),
          ),
        ),
        BlocProvider(
          create: (context) => ClubChooseBloc(
            repo: ClubRepository(),
            clubsState: const ClubChooseState(),
          ),
        ),
        BlocProvider(
          create: (context) => SubscriptionChooseBloc(
            repo: SubscriptionRepository(),
            subscriptionState: const SubscriptionChooseState(),
          ),
        )
      ],
      child: MaterialApp(
        theme: lightTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Fitness App',
        debugShowCheckedModeBanner: false, // debug banner remove: false
        routes: {
          '/': (context) => const LoginPage(),
          '/main': (context) => const MainPage(),
          '/not_working': (context) => const NotWorkingPage(),
          '/registration/first': (context) => const FirstRegistrationPage(),
          '/registration/second': (context) => const SecondRegistrationPage(),
          '/registration/choose': (context) => const ChoosePage(),
          '/registration/subscription': (context) =>
              const SubscriptionChoosePage(),
          '/registration/contract': (context) => const ContractStartPage(),
          '/rules': (context) => const RulesPage(),
          '/agreement': (context) => const AgreementPage(),
        },
        initialRoute: '/registration/contract',
      ),
    );
  }
}
