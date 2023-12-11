import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/ViewModel/africanfoodslist.dart';
import 'package:recipesfood/ViewModel/foodlist.dart';
import 'package:recipesfood/ViewModel/icecremlist.dart';
import 'package:recipesfood/ViewModel/juiceslist.dart';
import 'package:recipesfood/ViewModel/salad.dart';
import 'package:recipesfood/ViewModel/sweetslist.dart';
import 'package:recipesfood/home/africanfood.dart';
import 'package:recipesfood/home/ice_cream.dart';
import 'package:recipesfood/home/juices.dart';
import 'package:recipesfood/home/salad.dart';
import 'package:recipesfood/home/sweets.dart';
import 'package:recipesfood/provider/userprovider.dart';
import 'package:recipesfood/responsive/mobile_screen_layout.dart';
import 'package:recipesfood/responsive/responsive_layout.dart';
import 'package:recipesfood/responsive/web_screen_layout.dart';
import 'package:recipesfood/screens/all_recipes.dart';
import 'package:recipesfood/screens/get_started_screen.dart';
import 'package:recipesfood/screens/login_screen.dart';
import 'package:recipesfood/utils/colors.dart';

import 'ViewModel/saucelist.dart';
import 'home/sauces.dart';
import 'home/arabicfood.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyCjrjvFFr1Jh7PGCkVaJMODGKnT4ygk_kM",
  //         appId: "1:59699870809:web:bbe59c81d0e89b57024548",
  //         messagingSenderId: "59699870809",
  //         projectId: "foodvideos-ec749",
  //         storageBucket: "foodvideos-ec749.appspot.com"
  //     ),
  //
    // );
  // }
  //else {
    await Firebase.initializeApp();

 // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override


  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
    ChangeNotifierProvider(
       create: (_) => BooksList(),

       child: Home(),),
        ChangeNotifierProvider(
          create: (_) => IcecreamList(),

          child: IceCream(),),
        ChangeNotifierProvider(
          create: (_) => SAladist(),

          child: Arabicfood(),),
        ChangeNotifierProvider(
          create: (_) => AfricanfoodList(),

          child: const AfricanFood(),),
        ChangeNotifierProvider(
          create: (_) => SauceList(),

          child: const Sauces(),),
        ChangeNotifierProvider(
          create: (_) => Sweetslist(),

          child: Sweets(),),
        ChangeNotifierProvider(
          create: (_) => Juiceslist(),

          child: Juices(),),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Recipes',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor,
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // Checking if the snapshot has any data or not
                if (snapshot.hasData) {
                  // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                  return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

             // return const LoginScreen();
return const GetStartedScreen();
            },

          ),
          routes:<String,WidgetBuilder> {
            'login': (buildContext)=>const LoginScreen() ,
            'home':(buildContext) =>Home(),
            'salad':(buildContext) => Arabicfood(),
            'arabicFood':(buildContext) => const Salad(),
            'africanFood':(buildContext)=> const AfricanFood(),
            'iceCream' :(buildContext) => IceCream(),
            'lunch':(buildContext) => const Sauces(),
            'sweets':(buildContext) =>  Sweets(),
            'juices':(buildContext) => Juices(),
          }
      ),
    );
  }
}

