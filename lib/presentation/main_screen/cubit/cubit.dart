import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';
class HomeCubit extends Cubit<MainHomeState> {
  HomeCubit() : super(InitHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int index = 0;
  int indexTop = 0;
  List doctorsList=[];
  List searchList=[];
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
  void getData(filter) async{
    emit(LoadState());
    doctorsList=[];
   await FirebaseFirestore.instance.collection("doctors").doc(filter).collection("doctors_list").get().then((v){
      v.docs.forEach((elmint){
        doctorsList.add(elmint.data());
      });
      print(doctorsList);
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
