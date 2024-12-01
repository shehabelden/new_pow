import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'widget/home_info.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController text = TextEditingController();
    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<HomeCubit, MainHomeState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: width * .0277777777777778,
                right: width * .0277777777777778),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextField(
                  controller: text,
                  decoration: InputDecoration(
                    prefix: Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                    ),
                    label: Text(
                      "search",
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffCACACA)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (text) {
                    cubit.searchCubit(text);
                  },
                ),
                HomeInfo(
                  doctorsInfo: cubit.searchList,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
