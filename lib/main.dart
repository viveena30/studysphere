import 'package:flutter/services.dart';
import 'package:mcwc/const/const.dart';
import 'package:mcwc/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Brightness.dark, // Change this to Brightness.light if needed
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          Brightness.dark, // Change this to Brightness.light if needed
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          elevation: 0,

          // elevation: 0,
        ),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
