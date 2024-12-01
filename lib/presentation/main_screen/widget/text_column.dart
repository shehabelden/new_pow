import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
class TextColumn extends StatelessWidget {
  const TextColumn({super.key,required this.doctorMap});
  final Map doctorMap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctorMap["name"],
            style: GoogleFonts.manrope(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            doctorMap["category"],
            style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000)),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Color(0xffACA3A3),
                    size: 18,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text("10 km",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffACA3A3),
                      )),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(
                    "Available for ",
                    style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff50CC98)),
                  ),
                  SizedBox(
                    width: width*.2222222222222222,
                  ),
                  SvgPicture.asset("images/Cat.svg"),

                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset("images/Dog.svg"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//////////