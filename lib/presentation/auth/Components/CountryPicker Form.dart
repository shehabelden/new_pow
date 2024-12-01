import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/validators.dart';

class CountryPickerForm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;

  CountryPickerForm({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: (value) {
              // Handle country code change if needed
            },
            initialSelection: 'EG', // Set initial country code
            favorite: ['+20', 'EG'],
            showFlag: false, // Hide the flag
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 400,
              child: TextFormField(
                obscureText: false,
                controller: controller,
                keyboardType: keyboardType,
                validator: (v)=>MainValidator.phoneValid(v!),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Color(0xff747474),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF737373)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
