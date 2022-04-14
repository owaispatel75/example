// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/product.dart';
import '../constant.dart';
import 'package:http/http.dart' as http;
import 'recommendProduct.dart';

class HomeScreen extends StatelessWidget {
  Future<List<productApi>> fetchUsers() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    
    var response = await http.get(
        Uri.parse("http://172.29.1.208:2016/api/Productsview"),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var getUsersData = jsonDecode(response.body) as List;
      var listUsers = getUsersData.map((i) {
        return productApi.fromJson(i);
      }).toList();
      return listUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var data = "http://172.29.1.208:2016/api/Productsview";
    // // var api = getData();
    // var apiData = fetchUsers(data);
    SizeConfig().init(context);
    return Scaffold(
        // appBar: buildAppBar(),
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.all(defaultSize * 2), //20
            //   child: TitleText(
            //     title: "Browse by Categories",
            //   ),
            // ),
            // FutureBuilder(
            //   future: fetchUsers(),
            //   builder: (context, snapshot) => snapshot.hasData
            //       ? Categories(categories: snapshot.data)
            //       : Center(child: Image.asset("assets/ripple.gif")),
            // ),
            // Divider(height: 5),
            // Padding(
            //   padding: EdgeInsets.all(defaultSize * 2), //20
            //   child: TitleText(title: "Recommands For You"),
            // ),
            // Right Now product is our demo product
            FutureBuilder<List<productApi>>(
              future: fetchUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final productcard = snapshot.data as List<productApi>;
                  return RecommandProducts(products: productcard);
                }
                // return Center(child: Image.asset('assets/ripple.gif'));
                return const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.cyanAccent),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }

//   AppBar buildAppBar() {
//     return AppBar(
//       leading: IconButton(
//         icon: SvgPicture.asset(
//           "assets/icons/menu.svg",
//           height: SizeConfig.defaultSize * 2, //20
//         ),
//         onPressed: () {},
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: SvgPicture.asset(
//             "assets/icons/scan.svg",
//             height: SizeConfig.defaultSize * 2.4, //24
//           ),
//           onPressed: () {},
//         ),
//         Center(
//           child: Text(
//             "Scan",
//             style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(width: SizeConfig.defaultSize),
//       ],
//     );
//   }
}
