import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/cubit.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key,required this.cubit}) : super(key: key);
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = 0;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // Track the selected index
    final List<String> Categories = [
      "Vaccine",
      "Surgery",
      "SPA & Treatment",
      "Consultation"
    ];
    return Container(
      height: height*.0625,
      width: double.infinity,
      child: ListView.builder(
        itemCount: Categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, i) {
          return GestureDetector(
            onTap: () {
              cubit.getData(Categories[i]);
              cubit.topBarCubit(i);
              // Set the selected index when a button is tapped
              // setState(() {
              //   selectedIndex = i;
              // });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  "${Categories[i]}",
                  style: GoogleFonts.manrope(
                    color: i == cubit.indexTop
                        ? Colors.white
                        : Color(0xff3F3E3F).withOpacity(.30),
                    fontWeight: FontWeight.w700,

                  ),
                ),
                alignment: Alignment.center,
                height: height*.0625,
                decoration: BoxDecoration(
                  color: i == cubit.indexTop
                      ? Color(0xff70D6D1)
                      : Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
