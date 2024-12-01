import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pow/presentation/auth/cubit/cubit.dart';
import 'package:pow/utils/validators.dart';
class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String photo;
  final TextInputType keyboardType;
  final String hintText;
  final Widget? photo2;
  final AuthCubit? onPressed;
  final bool Obsecure;
  CustomFormField({
    Key? key,
    required this.controller,
    required this.photo,
    required this.keyboardType,
    required this.hintText,
    this.photo2,
    this.onPressed,
    required this.Obsecure,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    AuthCubit cubit=AuthCubit.get(context);
    return Container(
      width: 320,
      height: 55,
      child: TextFormField(
        obscureText: false,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          prefixIcon:widget.photo == "" ? SizedBox() :Container(
            width: 22,
            height: 22,
            child: Image.asset(widget.photo),
          ),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Color(0xff747474),
          ),
          // suffixIcon: widget.photo2 != null
          //     ? IconButton(
          //   onPressed: (){
          //     setState(() {
          //       _obscureText = !_obscureText; // Toggle visibility
          //     });
          //   },
          //   icon:Icon(
          //     _obscureText ==false ? Icons.visibility : Icons.visibility_off,
          //   ),
          // )
          //     : null,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF737373)),
          ),
        ),
        validator: (v)=>widget.hintText=="Your Name" ?MainValidator.usernameValid(v!) :widget.hintText=="Email" ? MainValidator.emailValid(v!):MainValidator.password(v!),
      ),

    );
  }
}
