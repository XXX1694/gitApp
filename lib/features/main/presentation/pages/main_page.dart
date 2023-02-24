import 'package:fit_app/features/coach/presentation/pages/coach_page.dart';
import 'package:fit_app/features/home/presentation/pages/home_page.dart';
import 'package:fit_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset('assets/icons/home_disable.svg'),
            activeIcon: SvgPicture.asset('assets/icons/home_active.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Coach',
            icon: SvgPicture.asset('assets/icons/coach_disable.svg'),
            activeIcon: SvgPicture.asset('assets/icons/coach_active.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: SvgPicture.asset('assets/icons/profile_disable.svg'),
            activeIcon: SvgPicture.asset('assets/icons/profile_active.svg'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const CoachPage();
          case 2:
            return const ProfilePage();
          default:
            return const HomePage();
        }
      },
    );
  }
}
