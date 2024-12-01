import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEditField extends StatelessWidget {
  final TextEditingController controller;
  final String photo;
  final TextInputType keyboardType;
  final String hintText;
  final String? photo2;
  final void Function()? onPressed;
  final bool Obsecure;

 const ProfileEditField({
    super.key,
    required this.controller,
    required this.photo,
    required this.keyboardType,
    required this.hintText,
    this.photo2,
    this.onPressed,
    required this.Obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: Obsecure,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(12),
         ),
        prefixIcon:photo == "" ? const SizedBox(
          height: 50,
        ) :SizedBox(
          width: 22,
          height: 60,
          child: Image.asset(photo),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color:const Color(0xff747474),
        ),
        suffixIcon: photo2 != null
            ? IconButton(
          onPressed: onPressed,
          icon: SizedBox(
            width: 22,
            height: 22,
            child: Image.asset(photo2!),
          ),
        )
            : null,
      ),
    );
  }
}
