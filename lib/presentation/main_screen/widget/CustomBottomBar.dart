import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/variables/main_list.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
class CustomBottomBar extends StatelessWidget {
  final List? bottomBarIconList;
  const CustomBottomBar({super.key, required this.bottomBarIconList});
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<HomeCubit, MainHomeState>(builder: (context, i) {
      return Container(
        width: double.infinity,
        height: height*.1,
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.only(left:width*.0555555555555556 , right: 0),
          child: ListView.builder(
              itemCount: bottomBarIconList!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (c, index) {
                return GestureDetector(
                  onTap: () {
                    cubit.bottomBarCubit(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: width*.2083333333333333, top: 20),
                    child: Container(
                      height: height*.025,
                      child: Column(
                        children: [
                          Container(
                            height: height*.025,
                            child: SvgPicture.asset(
                              MainList.SvgPicture[index],
                              color: index == cubit.index
                                  ? Color(0xff70D6D1)
                                  : Color(0xffBFBFBF),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          cubit.index == index
                              ? Container(
                                width: 12,
                                height: 2,
                                color: Color(0xff70D6D1),
                              )
                              : Text(""),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    });
  }
}