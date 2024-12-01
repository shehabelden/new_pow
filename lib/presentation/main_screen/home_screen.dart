import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'search.dart';
import 'widget/cover.dart';
import 'widget/filters.dart';
import 'widget/home_info.dart';
import 'widget/search.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    final List<String> Categories = [
      "Vaccine",
      "Surgery",
      "SPA & Treatment",
      "Consultation",
    ];
    cubit.getData(Categories[cubit.indexTop]);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeCubit, MainHomeState>(builder: (context, state) {
          return state is LoadState && cubit.doctorsList.isEmpty ? Center(child: CircularProgressIndicator()): Padding(
            padding: const EdgeInsets.only(top: 30, left: 0.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height*.8175,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Cover(),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20.0),
                                      child: InkWell(
                                          onTap: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return SearchScreen();
                                              }),
                                            );
                                          },
                                          child: Search()),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Filters(cubit:cubit),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    HomeInfo(doctorsInfo:cubit.doctorsList,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../home/cubit/cubit.dart';
// import '../home/cubit/state.dart';
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     double width=MediaQuery.of(context).size.width;
//     double height=MediaQuery.of(context).size.height;
//     TextEditingController text=TextEditingController();
//     MainCubit cubit=MainCubit.get(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       body: BlocBuilder<MainCubit,MainState>(
//           builder: (context,state) {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding:  EdgeInsets.only(top: 20,left: width*.0277777777777778, right: width*.0277777777777778),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
                    //   padding:  EdgeInsets.only(bottom: 20.0),
                    //   child:  Text("Search",style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 20,
                    //   ),),
                    // ),
                    // TextField(
                    //   controller: text,
                    //   decoration: InputDecoration(
                    //     prefix: Icon(
                    //       Icons.search,
                    //       color: Colors.grey.shade400,
                    //     ),
                    //     label: Text(
                    //       AppLocalizations.of(context)!.find_best_vaccinate_treatment,
                    //       style: GoogleFonts.manrope(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w700,
                    //           color: const Color(0xffCACACA)),
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //   ),
                    //   onChanged: (text){
                    //     cubit.searchCubit(text);
                    //   },
                    // ),
                    // Padding(
//                       padding: const EdgeInsets.only(top: 10.0,left: 10),
//                       child: SizedBox(
//                         height: 300,
//                         width: 360,
//                         child: ListView.builder(
//                             itemCount:cubit.searchList.length ,
//                             itemBuilder: (c,i){
//                               return Text("${cubit.searchList[i]}",
//                                 style: GoogleFonts.manrope(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700,
//                                     color: const Color(0xffCACACA)),
//                               );
//                             }),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }
//       ),
//     );
//   }
// }
