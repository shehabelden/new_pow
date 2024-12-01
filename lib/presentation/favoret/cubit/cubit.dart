import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';
class FavoriteCubit extends Cubit<MainFavoriteCubitState> {
  FavoriteCubit() : super(InitFavoriteCubitState());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  int index = 0;
  int indexTop = 0;
  List favoriteList=[];
  List searchList=[];
  addData(filter,map) async{
    emit(LoadState());
    await FirebaseFirestore.instance.collection("Profile").doc(filter).collection("favorite").add(map);
    emit(GerDataState());
  }
  void bottomBarCubit(i) {
    index = i;
    print(index);
    emit(CustomBottomBarState());
  }
  void topBarCubit(i) {
    indexTop = i;
    print(index);
    emit(TopBottomBarState());
  }
  void getData(id) async{
    emit(LoadState());
    favoriteList=[];
   await FirebaseFirestore.instance.collection("Profile").doc(id).collection("favorite").get().then((v){
      v.docs.forEach((elmint){
        favoriteList.add(elmint.data());
      });
      print(favoriteList);
    });
    emit(GerDataState());
  }
  searchCubit(search)async{
    emit(EmptyState());
    if(search==""){
      searchList=[];
    }else{
      await FirebaseFirestore.instance.collectionGroup("doctors_list")
          .orderBy("name").startAt([search]).endAt([search + "\uf8ff"]).get().then((value) {
        searchList=[];
        value.docs.forEach((element) {
          searchList.add(element.data()["name"]);
        });
      });}
    print(searchList.toString());
    emit(GetShopData());
  }

}
