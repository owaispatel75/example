import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:gcg_ec/model/product.dart';
import 'package:gcg_ec/pages/contact.dart';
import 'package:gcg_ec/pages/detailPages/detailPage.dart';
import 'package:gcg_ec/pages/mycart.dart';


import 'package:http/http.dart' as http;

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as htmldom;


//main page

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            backgroundColor: Colors.amber,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                ' ',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyCart()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, right: 20),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 28,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      /*  Text(
                        'Cart',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue),
                      )*/
                    ],
                  ),
                ),
              ),
              //GestureDetector(
              // onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const MyFavorite()));

              // Navigator.pop(context);
              //},
              // child: Padding(
              //   padding: const EdgeInsets.only(top: 12, right: 40),
              //   child: true
              //       ? Badge(
              //           badgeContent: Text(
              //             //favouriteitems.length.toString(),
              //             "text",
              //             style: TextStyle(
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w900,
              //                 color: Colors.white),
              //           ),
              //           child: const Icon(
              //             Icons.favorite,
              //             color: Colors.black,
              //             size: 28,
              //           ),
              //         )
              //       : const Icon(
              //           Icons.favorite,
              //          // color: Colors.Colors.black,
              //           size: 28,
              //         ),
              // ),
              // ),
            ],
          ),
          body: FutureBuilder<List<productApi>>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var productList = snapshot.data as List<productApi>;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'HOME',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black26)),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: MaterialButton(
                                  hoverColor: Colors.white,
                                  splashColor: Colors.white,
                                  highlightColor: Colors.white,
                                  focusColor: Colors.white,
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(Icons.filter_list_alt),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "Filter",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 43,
                              child: new Flexible(
                                  child: new TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 22,
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'Search',
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 450,
                        child: Column(
                          children: [
                            TabBar(
                                controller: _controller,
                                unselectedLabelStyle:
                                    const TextStyle(fontSize: 12),
                                labelStyle: const TextStyle(fontSize: 12),
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber),
                                unselectedLabelColor: Colors.grey.shade800,
                                tabs: const [
                                  Tab(
                                    text: 'All',
                                  ),
                                  Tab(
                                    text: 'printers',
                                  ),
                                  Tab(
                                    text: 'service',
                                  ),
                                ]),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: TabBarView(
                                  controller: _controller,
                                  children: [
                                    _buildlistitem(items: productList),
                                    _buildlistitem(items: productList),
                                    _buildlistitem(items: productList),

                                    // Text("hello"),
                                    // Text("hello"),
                                    // Text("hello")
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      contactpage()
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.cyanAccent),
              );
            },
          )),
    );
  }

  Widget _buildlistitem({required List<productApi> items}) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _builditem(myitems: items, index: index);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );

    /*ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? BounceInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index))
              : BounceInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index));
        });*/
  }

  Widget _builditem({required List<productApi> myitems, required int index}) {
    var img = Image.asset(
      'images/download.png',
      width: 100.0,
      //height: .0,
      fit: BoxFit.cover,
    );
    var image = myitems[index].imagePath!.isNotEmpty
        ? myitems[index].imagePath![0].imagePath.toString()
        : " ";

    var itemDesc = myitems[index].iTEMDESCRIPTION != null
        ? parse(myitems[index].iTEMDESCRIPTION).documentElement!.text
        : "item description";

    var shortdes = myitems[index].shortDescription != null &&
            myitems[index].shortDescription!.isNotEmpty
        ? parse(myitems[index].shortDescription).documentElement!.text
        : "No short description";

    return GestureDetector(
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          itemDesc,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          shortdes.substring(0, 10),
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ),
                      /* const Spacer(),
                         Text(
                        ' \$ ${myitems[index].price} ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.Colors.black54),
                      ),*/
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: Image.network(
                          "http://172.29.1.208:2020/$image",
                          fit: BoxFit.fill,
                          width: 100,
                          // height: 300,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   myitems[index].isselected =
                            //       !myitems[index].isselected;
                            // });
                            // myitems[index].isselected
                            //     ? favouriteitems.add(myitems[index])
                            //     : favouriteitems.remove(myitems[index]);
                          },
                          child: Icon(
                            Icons.favorite_sharp,
                            color: true ? Colors.red : Colors.grey[300],
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
      onTap: () {
         Navigator.push(
             context,
             MaterialPageRoute(
                builder: (_) => detailsPage(
                      item: myitems[index],
                     )
                     ));
      },
    );
  }
}


















/* import 'dart:convert';



import 'package:dio/dio.dart';
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
*/
