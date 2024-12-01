import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pow/firebase_options.dart';
import 'package:pow/presentation/auth/SignUp.dart';
import 'package:pow/presentation/auth/Signin.dart';
import 'package:pow/presentation/auth/cubit/cubit.dart';
import 'package:pow/presentation/auth/user_layer.dart';
import 'package:pow/presentation/main_screen/main_screen.dart';
import 'package:pow/presentation/profile/cubit/cubit.dart';
import 'package:pow/presentation/ui_temb/OnBoarding.dart';
import 'presentation/favoret/cubit/cubit.dart';
import 'presentation/main_screen/cubit/cubit.dart';
import 'presentation/main_screen/home_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => FavoriteCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff6bccd1)),
          useMaterial3: true,
        ),
        routes: {
          "HomeScreen": (context) => HomeScreen(),
          "signup": (context) => SignUp(),
          "signin": (context) => Signin(),
          "login_check": (context) => Signin(),
          "OnBording": (context) => OnBoarding(),
        },
        home:const UserLayer(),
      ),
    );
  }
}
