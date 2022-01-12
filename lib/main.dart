import 'package:flutter/material.dart';
import 'package:native_app/mobile.dart';

import 'desktop.dart';
import 'native_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
         home: Builder(builder: (BuildContext context)
         {
           MediaQuery.of(context).size.width;
           if(MediaQuery.of(context).size.width.toInt() <=560 )
             return MediaQuery(
                 data: MediaQuery.of(context).copyWith(
                   textScaleFactor: 0.9
                 ),
                 child: MobileScreen());
           
           return MediaQuery(
               data: MediaQuery.of(context).copyWith(
                 boldText: true,
               ),
               child: DesktopScreen());
         },));
  }
}
