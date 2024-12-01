import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class AuthCubit extends Cubit<AuthMainState> {
  AuthCubit() : super(AuthInitState());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool view=false;
  signInCubit(emailAddress, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    emit(SignInState());
  }
  signUpCubit(emailAddress, password,name,phone) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    ).then((value)async{
      await  createProf(FirebaseAuth.instance.currentUser!.uid,name,emailAddress,phone);
    });
    emit(SignUpState());
  }
  createProf(uid,name,email,phone)async{
   await FirebaseFirestore.instance.collection("Profile").doc(uid).set(
     {
       "name":name,
       "email":email,
       "phone":phone,
     }
   );
  }
  check(){
    bool x=view;
    view!=x;
    print(view);
    emit(ViewState());
  }
}
