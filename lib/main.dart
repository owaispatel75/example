import 'package:flutter/material.dart';
import 'package:gcg_ec/model/orders.dart';
import 'package:gcg_ec/pages/dashboard.dart';
import 'package:gcg_ec/pages/enquiry.dart';
import 'package:gcg_ec/pages/salesOrderpage.dart';
import 'package:gcg_ec/pages/shipingdata.dart';
import 'package:gcg_ec/pages/sidemenu/sidemenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Image Loader',
 debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Poppins',
        // primaryColor: Colors.white,
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   elevation: 0,
        //   foregroundColor: Colors.white,
        // ),
        textTheme: const TextTheme(
            // headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
            // headline2: TextStyle(
            //   fontSize: 24.0,
            //   fontWeight: FontWeight.w700,
            //   color: Colors.redAccent,
            // ),
            // bodyText1: TextStyle(
            //   fontSize: 14.0,
            //   fontWeight: FontWeight.w400,
            //   color: Colors.blueAccent,
            // ),
            ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromARGB(255, 229, 147, 147)),
      ),
       home: 
       SalesOredrPage(),
        // productStoreData(),
// VerticalTabs(
//   tabsWidth: 150,
//   tabs: const <Tab>[
//     Tab(child: Text('Flutter'), icon: Icon(Icons.phone)),
//     Tab(child: Text('Dart')),
//     Tab(child: Text('NodeJS')),
//     Tab(child: Text('PHP')),
//     Tab(child: Text('HTML 5')),
//   ],
//   contents: <Widget>[
//     Container(child: Text('Flutter'), padding: EdgeInsets.all(20)),
//     Container(child: Text('Dart'), padding: EdgeInsets.all(20)),
//     Container(child: Text('NodeJS'), padding: EdgeInsets.all(20)),
//     Container(child: Text('PHP'), padding: EdgeInsets.all(20)),
//     Container(child: Text('HTML 5'), padding: EdgeInsets.all(20))
//   ],
// ),
      );
  }
}
