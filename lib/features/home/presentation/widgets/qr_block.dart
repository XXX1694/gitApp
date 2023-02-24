import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrBlock extends StatelessWidget {
  const QrBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'QR code',
            // AppLocalizations.of(context)!.qrCode,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: height * 0.19,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _data.length,
            itemBuilder: (context, index) => CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.pushNamed(context, _data[index]['nav']);
              },
              child: Container(
                margin: index == 0
                    ? const EdgeInsets.fromLTRB(20, 0, 12, 0)
                    : const EdgeInsets.only(right: 12),
                width: width * 0.28,
                height: height * 0.19,
                decoration: BoxDecoration(
                  color: _data[index]['color'],
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 26),
                    SvgPicture.asset(
                      _data[index]['icon'],
                    ),
                    const Spacer(flex: 19),
                    Text(
                      _data[index]['text'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                        fontFamily: '123',
                      ),
                    ),
                    const Spacer(flex: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List _data = [
  {
    'text': 'Enter the club',
    'icon': 'assets/icons/enter_icon.svg',
    'color': const Color(0XFF222222).withOpacity(0.8),
    'nav': '/qr_enter',
  },
  {
    'text': 'Leave a review',
    'icon': 'assets/icons/review_icon.svg',
    'color': const Color(0XFFFF9D76).withOpacity(0.8),
    'nav': '/qr_review',
  },
  // {
  //   'text': 'Online Coach',
  //   'icon': 'assets/icons/online_coach_icon.svg',
  //   'color': const Color(0XFFFB3569).withOpacity(0.8),
  //   'nav': '/not_working',
  // },
  // {
  //   'text': 'Online Coach',
  //   'icon': 'assets/icons/online_coach_icon.svg',
  //   'color': const Color(0XFFFB3569).withOpacity(0.8),
  //   'nav': '/not_working',
  // },
];
