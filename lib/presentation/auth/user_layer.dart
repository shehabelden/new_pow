import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pow/presentation/auth/Signin.dart';
import 'package:pow/presentation/main_screen/main_screen.dart';

class UserLayer extends StatefulWidget {
  const UserLayer({super.key});

  @override
  State<UserLayer> createState() => _UserLayerState();
}

class _UserLayerState extends State<UserLayer> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser ==null ? Signin() :MainScreen();
  }
}