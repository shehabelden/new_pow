import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'widget/profile_info.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    ProfileCubit cubit=ProfileCubit.get(context);
    cubit.getProfileDate();
    return Scaffold(
      body: BlocBuilder<ProfileCubit,ProfileState>(
    builder: (context,state) {
      return cubit.profileMap.isEmpty && state is LoadProfileState  ? const Center(child:CircularProgressIndicator(),) :
        SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child:Stack(
                    children: [
                      Image.asset("images/rec.png",width: double.infinity,),
                      Padding(
                        padding:  EdgeInsets.only(left: width*.3611111111111111),
                        child: Column(
                          children: [
                            SizedBox(height: .225*height,),
                            InkWell(
                              onTap: ()async{
                               await cubit.addImage();
                              },
                              child:cubit.profileMap["image"]==null? Container(
                                height: height*.125,
                                width: .2777777777777778*width,
                                decoration:const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ):Container(
                              height: height*.125,
                              width: .2777777777777778*width,
                              decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                                image: DecorationImage(image: NetworkImage(cubit.profileMap["image"]),fit: BoxFit.cover)
                              ),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                   Text("${cubit.profileMap["name"]}"),
                   Text("${cubit.profileMap["email"]} | ${cubit.profileMap["phone"]}"),
                  ],
                ),
                const SizedBox(height: 50,),
                const ProfileInfo(),
              ],
            ),
          );
        }
      ),
    );
  }
}