import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pow/presentation/main_screen/home_screen.dart';
import 'package:pow/presentation/main_screen/info_screen.dart';
import 'package:pow/presentation/ui_temb/OnBoarding.dart';
import 'package:pow/utils/variables/main_list.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens = [
    OnBoarding(),
    InfoScreen(doctorInfo: {},),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex], // Display the selected screen

      bottomNavigationBar: Container(
        height: 76,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            buildNavItem(0),
            buildNavItem(1),
            buildNavItem(2),
            buildNavItem(3),
            buildSelectionIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(int index) {
    return Positioned(
      top: 29,
      left: 35 + (index * 102),
      child: GestureDetector(
        onTap: () {
          onItemTapped(index);
        },
        child: Container(
          width: 25,
          height: 25,
          child: SvgPicture.asset(
            MainList.SvgPicture[index],
            color:
                index == selectedIndex ? Color(0xff70D6D1) : Color(0xffBFBFBF),
          ),
        ),
      ),
    );
  }

  Widget buildSelectionIndicator() {
    return Positioned(
      top: 55,
      left: 35 + (selectedIndex * 102) + (25 / 2 - 12 / 2),
      child: Container(
        width: 12,
        height: 2,
        color: Color(0xff70D6D1),
      ),
    );
  }
}
