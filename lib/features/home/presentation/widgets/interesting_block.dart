import 'package:flutter/material.dart';

class InterestingBlock extends StatelessWidget {
  const InterestingBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Intersting',
            // AppLocalizations.of(context)!.interesting,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: height * 0.42,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              height: height * 0.42,
              width: width * 0.67,
              padding: const EdgeInsets.all(0),
              margin: index == 0
                  ? const EdgeInsets.fromLTRB(20, 0, 16, 0)
                  : const EdgeInsets.fromLTRB(0, 0, 16, 0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    // blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              // child: Image.asset(
              //   'assets/img/img_1.png',
              //   fit: BoxFit.fill,
              //   height: double.infinity,
              //   width: double.infinity,
              // ),
            ),
          ),
        )
      ],
    );
  }
}
