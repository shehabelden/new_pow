import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'state.dart';
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  Map<String,dynamic> profileMap={};
  String ? getimage;
  getProfileDate()async{
    emit(LoadProfileState());
    await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
     profileMap=value.data()!;
    });
    emit(GetProfileState());
  }
  updateProfile(name,email,phone)async{
    await getProfileDate();
    await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).update({
      "name": name==null ?profileMap["name"]:name,
      "email":email==null ?profileMap["email"]:email,
      "phone":phone==null ?profileMap["phone"]:phone,
    });
    emit(UpdateProfileState());
  }
  addImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var formatter = new DateFormat('yyyy-MM-dd  hh:mm:ss');
    var now = new DateTime.now();
    String formattedDate = formatter.format(now);
    if (result != null) {
      String fileName = result.files.first.path!;
      // Upload file
      final file=File(fileName);
      await FirebaseStorage.instance
          .ref('uploads/${FirebaseAuth.instance.currentUser!.uid} ${formattedDate}')
          .putFile(file);
      getimage = await FirebaseStorage.instance
          .ref('uploads/${FirebaseAuth.instance.currentUser!.uid} ${formattedDate}')
          .getDownloadURL();
      FirebaseFirestore.instance
          .collection("Profile")
          .doc(FirebaseAuth.instance.currentUser!.uid).update({
        "image": getimage!,
      });
    }
    emit(AddImageProfileState());
  }
}


