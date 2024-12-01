import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/form_jey.dart';
import '../ui_temb/Policy.dart';
import 'Components/CountryPicker Form.dart';
import 'Components/TextFormField.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController password2 = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final TextEditingController person = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    MainFormKey.signUpFormKey;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed("signin");
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthMainState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: MainFormKey.signUpFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * .0625,
                ),
                SvgPicture.asset(
                    'images/Group 278.svg'), // Check the path to your SVG image
                SizedBox(
                  height: height * .0625,
                ),
                Text(
                  "Sign up",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                CustomFormField(
                  controller: person,
                  photo: "images/Profile.png",
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Your Name",
                  Obsecure: false,
                ),
                SizedBox(height: 10),
                CustomFormField(
                  controller: email,
                  photo: "images/Message.png",
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  Obsecure: false,
                ),
                SizedBox(height: 10),
                CountryPickerForm(
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  hintText: "Phone Number",
                ),
                CustomFormField(

                  controller: password,
                  photo: "images/Password.png",
                  keyboardType: TextInputType.text,
                  hintText: "Password",
                  Obsecure: true,
                ),
                SizedBox(height: 10),
                CustomFormField(
                  controller: password2,
                  photo: "images/Password.png",
                  onPressed: cubit,
                  keyboardType: TextInputType.emailAddress,
                  photo2: Icon(Icons.remove_red_eye_outlined),
                  hintText: "Repeat Password",
                  Obsecure: true,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " By continuing you indicate that you have read and agree",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff000000).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "to our terms and conditions ",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff000000).withOpacity(0.5),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        child: Text(
                          'privacy policy.',
                          style: GoogleFonts.roboto(
                            color: Color(0xff000000),
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff000000),
                            decorationThickness: 2.0,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Policy()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: width*.8628571428571429,
                  height: height*.0625,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff70D6D1),
                  ),
                  child: InkWell(
                    onTap: () {
                 if (MainFormKey.signUpFormKey.currentState!.validate()) {
    cubit.signUpCubit(email.text, password.text, person.text,phone.text);
    }
                 else{

                 }
                    },
                    child: Center(
                      child: Text(
                        "Continue",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: .20,
                      color: Colors.cyan,
                    ),
                    Text(
                      "or",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 24,
                        color: Color(0xff6D8DBA),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: .20,
                      color: Colors.cyan,
                    ),
                  ],
                ),
                Container(
                  width: width*.8628571428571429,
                  height: height*.0625,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xffDC3C2A)),
                  ),
                  child: InkWell(
                    onTap: () {
                      cubit.signUpCubit(email.text, password.text, person.text,phone.text);
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Continue with",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            "  Google",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xffDC3C2A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?  ",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff000000).withOpacity(0.5),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        child: Text(
                          'Login.',
                          style: GoogleFonts.roboto(
                            color: Color(0xffE76D3C),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xffE76D3C),
                            decorationThickness: 2.0,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed("signin");
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
