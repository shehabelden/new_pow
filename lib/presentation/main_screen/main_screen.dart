import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pow/presentation/main_screen/home_screen.dart';
import 'package:pow/presentation/main_screen/widget/CustomBottomBar.dart';
import 'package:pow/presentation/profile/profilescreen.dart';

import '../../utils/variables/main_list.dart';
import '../favoret/favoret.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List viewList=[
      HomeScreen(),
      FavoriteScreen(),
      HomeScreen(),
      ProfileScreen(),

    ];
    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
      body: BlocBuilder<HomeCubit, MainHomeState>(builder: (context, state) {
          return viewList[cubit.index];
        }
      ),
      bottomNavigationBar: CustomBottomBar(
        bottomBarIconList: MainList.bottomBarIconList,
      ),
    );
    }

}
