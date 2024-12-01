import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pow/presentation/favoret/cubit/cubit.dart';
import 'package:pow/presentation/favoret/cubit/state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    FavoriteCubit cubit=FavoriteCubit.get(context);
    cubit.getData(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(
      body: BlocBuilder<FavoriteCubit,MainFavoriteCubitState>(
        builder: (context,state) {
          return Column(
            children: [
              SizedBox(
                height: height*.0625,
                width: double.infinity,
              ),
              Padding(
                padding:  EdgeInsets.only(left: width*.0555555555555556,top: height*.0125),
                child: ListView.builder(
                    itemCount: cubit.favoriteList.length,
                    shrinkWrap: true,
                    itemBuilder:(c,i){
                  return Padding(
                    padding:  EdgeInsets.only(bottom: height*.025),
                    child: Container(
                      child: Row(
                        children: [
                          cubit.favoriteList[i]["doctor_info"]["image"]!=null?  Container(
                            height: .0875*height ,
                            width: .0875*height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(cubit.favoriteList[i]["doctor_info"]["image"]),
                              )
                            ),
                          ):Container(
                            height: .0875*height ,
                            width: .0875*height,
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(cubit.favoriteList[i]["doctor_info"]["name"],style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              )),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Icon(Icons.location_on_outlined),
                                Text("Haram, Giza",style: GoogleFonts.roboto(

                                )),
                              ],)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          );
        }
      ),
    );
  }
}
