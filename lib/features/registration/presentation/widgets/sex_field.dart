import 'package:fit_app/common/theme/colors.dart';
import 'package:flutter/material.dart';

List<String> items = [
  'Sex',
  'Male',
  'Female',
  'Other',
];
String selectedItem = uniquelist[0];
var seen = <String>{};
List<String> uniquelist = items.where((sex) => seen.add(sex)).toList();

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: defaultTextColor100,
                  ),
              // icon: SvgPicture.asset(
              //   'assets/icons/arrow_under_icon.svg',
              //   height: 6,
              // ),
              isExpanded: true,
              value: selectedItem,
              items: uniquelist
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: item == 'Sex'
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: defaultTextColor80)
                              : Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: defaultTextColor100),
                        ),
                      ))
                  .toList(),
              onChanged: ((item) {
                setState(() {
                  selectedItem = item.toString();
                  widget.controller.text = selectedItem;
                });
              }),
            ),
          ),
        ),
      ),
    );
  }
}
