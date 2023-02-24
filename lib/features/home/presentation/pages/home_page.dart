import 'package:fit_app/features/home/presentation/widgets/interesting_block.dart';
import 'package:fit_app/features/home/presentation/widgets/qr_block.dart';
import 'package:fit_app/features/home/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 16),
            TopBar(txt: ''),
            SizedBox(height: 20),
            InterestingBlock(),
            SizedBox(height: 20),
            QrBlock(),
          ],
        ),
      ),
    );
  }
}
