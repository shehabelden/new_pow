import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pow/presentation/auth/cubit/state.dart';
import 'Components/TextFormField.dart';
import 'cubit/cubit.dart';
final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
class Signin extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  Signin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthCubit cubit=AuthCubit.get(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
      ),
      body: BlocBuilder<AuthCubit,AuthMainState>(
        builder: (context,state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height*.0625,
                ),
                SvgPicture.asset(
                  'images/Group 278.svg',
                ),
                SizedBox(
                  height: height*.1875,
                ),
                Text(
                  "Sign In",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  controller: email,
                  photo: "images/Message.png",
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  Obsecure: false,

                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  controller: password,
                  photo: "images/Password.png",
                  keyboardType: TextInputType.text,
                  hintText: "Password",
                  Obsecure: true,
                ),
                Row(
                  children: [
                    Container(
                      width: .5694444444444444*width,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot the password?",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color(0xff6D8DBA)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                   height: height*.0625,
                ),
                Container(
                  width: width*.8628571428571429,
                  height: height*.0625,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff70D6D1),
                  ),
                  child: InkWell(
                    onTap: () {
                      //UserLayer
                      Navigator.of(context).pushReplacementNamed("login_check");
                      cubit.signInCubit(email.text, password.text);
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
                      cubit.signInCubit(email.text, password.text);
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?    ",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff000000).withOpacity(0.5),
                      ),
                    ),
                    Container(
                        child: InkWell(
                      child: Text('Register now',
                          style: GoogleFonts.roboto(
                              color: Color(0xffE76D3C),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(
                                  0xffE76D3C), // Specify your underline color here
                              decorationThickness: 2.0)),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed("signup");
                      },
                    ))
                  ],
                ),
                SizedBox(height: height*.05,)
              ],
            ),
          );
        }
      ),
    );
  }
}
