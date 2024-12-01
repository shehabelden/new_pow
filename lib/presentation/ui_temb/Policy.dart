import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:30 ,
                    ),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Review Paw’s\n Privacy Policy ",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 33,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "At Paw, we understand that your privacy \n"
                          "is important. This Privacy Policy outlines how \nwe collect, use, and protect your personal\n information.",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 52,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "1. Information We Collect:",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 125,
                      child: Text(
                        "We may collect personal information such as your name, email address, and phone number when you use our app. We may also collect \n"
                            "non-personal information such as your device type, operating system, and app usage data.",
                        maxLines: 7, // Adjust as needed
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "2. How We Use Your Information:",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 125,
                      child: Text(
                        "We use your personal information to provide you with a personalized experience on our app, to communicate with you about your trip to Egypt. We may also use your information for marketing purposes, such as sending you promotional offers or updates about our app.",
                        maxLines: 6, // Adjust as needed
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "3. Sharing Your Information:",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 130,
                      child: Text(
                        "Sharing Your Information: We do not share your personal information with third parties except for the purpose of providing you with travel-related services. We may also share non-personal information with third-party analytics providers to improve our app.",
                        maxLines: 6, // Adjust as needed
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "4. Security:",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 130,
                      child: Text(
                        "We take reasonable measures to protect your personal information from unauthorized access, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is completely secure.",
                        maxLines: 6, // Adjust as needed
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "5. Your Choices:",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 130,
                      child: Text(
                        "You can choose not to provide us with certain personal information, but this may limit your ability to use certain features of our app. You can also opt-out of receiving marketing communications from us at any time.",
                        maxLines: 6, // Adjust as needed
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "5. Your Choices:",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 130,
                      child: Text(
                        "You can choose not to provide us with certain personal information, but this may limit your ability to use certain features of our app. You can also opt-out of receiving marketing communications from us at any time.",
                        maxLines: 6, // Adjust as needed
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "6. Changes to this Policy:",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 80,
                      child: Text(
                        "We may update this Privacy Policy from time to time. Any changes will be posted on our app and will become effective immediately upon posting.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      child: Text(
                        "If you have any questions or concerns about\n      this Privacy Policy, please contact us at ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      GestureDetector(
                        child: Text(
                          "Egyptusapp@gmail.com",
                          style: GoogleFonts.roboto(
                            color: Color(0xff2687EE),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),


                SizedBox(
                  height: 30,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}