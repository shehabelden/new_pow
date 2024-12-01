import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pow/presentation/auth/user_layer.dart';

import 'profile_update.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height/7,
      width:  .6944444444444444*width,
      padding:const EdgeInsets.only(left: 20,top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset:const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const ProfileUpdate();
                }),
              );
            },
            child: Row(
              children: [
                SvgPicture.asset(
                    "images/Frame.svg"
                ),
                Text("  Edit profile information",style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: ()async{
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const UserLayer();
                }),
              );

            },
            child: Row(
              children: [
                const Icon(Icons.logout_sharp),
                Text("  log out",style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}