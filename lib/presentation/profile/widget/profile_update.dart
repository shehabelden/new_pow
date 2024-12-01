import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/profile_edit_field.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController fullName = TextEditingController();
    final TextEditingController phone = TextEditingController();
    ProfileCubit cubit=ProfileCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        actions: [Text("edit profile",style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
         const SizedBox(width: 120,)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20,),
        child: Column(children: [
          const Expanded(flex: 1,child:SizedBox() ,),
          ProfileEditField(
            controller: fullName,
            photo: "",
            keyboardType: TextInputType.text,
            hintText: "full name",
            Obsecure: false,
          ),
          const SizedBox(height: 20,),
          ProfileEditField(
            controller: email,
            photo: "",
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            Obsecure: false,
          ),
          const SizedBox(height: 20,),
          ProfileEditField(
            controller: phone,
            photo: "",
            keyboardType: TextInputType.phone,
            hintText: "phone",
            Obsecure: false,
          ),
          const SizedBox(height: 100,),
          BlocBuilder<ProfileCubit,ProfileState>(
              builder: (context,state) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: SizedBox(
                    height: 50,
                    child: InkWell(
                    onTap: () {
                      cubit.updateProfile(fullName.text, email.text,phone.text);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 00),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:const Color(0xFF70D6D1),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "submit",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ),
                                  ),
                  ),
                );
            }
          ),
        ],),
      ),
    );
  }
}
