import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        height: 52,
        width: 600,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Find best vaccinate, treatment...",
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xffCACACA)
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
