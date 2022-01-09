import 'package:el_emegim/views/navigation_bar_pages/3.home_page.dart';
import 'package:el_emegim/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'material/bottom_navigation_bar.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // FirebaseApp defaultApp = await Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
/*    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const GetMaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
        } else {
          // Loading is done, return the app:*/
          return GetMaterialApp(

            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            getPages: [
              GetPage(name: '/', page: () =>  BottomNavBar()),
            ],
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: BottomNavBar(),
          );
/*        }
      }
    );*/
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 2));
  }
}
