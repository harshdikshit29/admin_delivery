import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/App-constant/string.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.selectedIndex});
  static const String id = "BottomBar";
  final int selectedIndex;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List<IconData> icons = [
    Icons.home,
    Icons.explore_rounded,
    CupertinoIcons.globe,
    Icons.favorite,
  ];

  final List<String> textLabels = [
    AppString.home,
    AppString.explore,
    AppString.world,
    AppString.refer,
  ];

  final Color defaultColor = AppColors.white;
  final Color selectedColor = AppColors.red;

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // Adjust height as needed
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          icons.length,
          (index) =>
              _buildItem(icons[index], textLabels[index], context, index),
        ),
      ),
    );
  }

  Widget _buildItem(
      IconData icon, String textLabel, BuildContext context, int index) {
    return GestureDetector(
      onTap: () async {
        // setState(() {
        //   _selectedIndex = index; // Update selected index
        // });
        if (icon == Icons.home) {
         // Get.to(const Home());
          setState(() {
            _selectedIndex = 0;
          });
        } else if (icon == Icons.explore_rounded) {
         // Get.to(const Explore());
          setState(() {
            _selectedIndex = 1;
          });
        } else if (icon == CupertinoIcons.globe) {
          //Get.to(const World());
          setState(() {
            _selectedIndex = 2;
          });
        } else if (icon == Icons.favorite) {
          //Get.to(Refrels());
          setState(() {
            _selectedIndex = 3;
          });
        } else {}
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24.0,
            color: _selectedIndex == index ? selectedColor : defaultColor,
          ),
          const SizedBox(height: 4.0),
          CustomText(
            text: textLabel,
            fontSize: 12,
            textColor: _selectedIndex == index ? selectedColor : defaultColor,
          )
        ],
      ),
    );
  }
}
