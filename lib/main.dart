import 'package:flutter/material.dart';
import 'package:qwikio_driver/Screens/s/Cab/caboffline.dart';
import 'package:qwikio_driver/Screens/s/Cab/chatbox.dart';
import 'package:qwikio_driver/Screens/s/OBD/diagnostic.dart';
import 'package:qwikio_driver/Splash%20&%20Onbording/SplashScreen.dart';
import 'package:qwikio_driver/Login&Signup/loadverify.dart';
import 'package:qwikio_driver/Screens/s/Truck Driver/truckdriver.dart';
import 'package:qwikio_driver/Screens/s/Profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qwikio Driver',
      theme: ThemeData(
        fontFamily: 'Cairo',
        accentColor: Color(0xffFDFDFD),
        backgroundColor: Color(0xffFDFDFD),
        appBarTheme: AppBarTheme(
          color: Color(0xffFDFDFD),
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: splashScreen.id,
      routes: <String, WidgetBuilder>{
        splashScreen.id: (context) => splashScreen(),
        LoadVerify.id: (context) => LoadVerify(),
        CabOffline.id: (context) => CabOffline(),
        ChatBox.id: (context) => ChatBox(),
        Truckdriver.id: (context) => Truckdriver(),
        Profile.id: (context) => Profile(),
        Diagnostic.id: (context) => Diagnostic(),
      },
    );
  }
}
