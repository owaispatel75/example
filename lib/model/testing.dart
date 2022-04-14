// // import 'package:flutter/material.dart';

// // class MyAppState extends StatefulWidget {
// //   @override
// //   State<MyAppState> createState() => _MyAppStateState();
// // }

// // class _MyAppStateState extends State<MyAppState> {
// //   List<Map> _books = [
// //     {'id': 100, 'title': 'Flutter Basics', 'author': 'David John'},
// //     {'id': 101, 'title': 'Flutter Basics', 'author': 'David John'},
// //     {'id': 102, 'title': 'Git and GitHub', 'author': 'Merlin Nick'}
// //   ];

// //   int _currentSortColumn = 0;

// //   bool _isSortAsc = true;

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('DataTable Demo'),
// //         ),
// //         body: ListView(
// //           children: [_createDataTable()],
// //         ),
// //       ),
// //     );
// //   }

// //   DataTable _createDataTable() {
// //     return DataTable(
// //       columns: _createColumns(),
// //       rows: _createRows(),
// //       sortColumnIndex: _currentSortColumn,
// //       sortAscending: _isSortAsc,
// //     );
// //   }

// //   List<DataColumn> _createColumns() {
// //     return [
// //       DataColumn(
// //         label: Text('ID'),
// //         onSort: (columnIndex, _) {
// //           setState(() {
// //             _currentSortColumn = columnIndex;
// //             if (_isSortAsc) {
// //               _books.sort((a, b) => b['id'].compareTo(a['id']));
// //             } else {
// //               _books.sort((a, b) => a['id'].compareTo(b['id']));
// //             }
// //             _isSortAsc = !_isSortAsc;
// //           });
// //         },
// //       ),
// //       DataColumn(label: Text('Book')),
// //       DataColumn(label: Text('Author'))
// //     ];
// //   }

// //   List<DataRow> _createRows() {
// //     return _books
// //         .map((book) => DataRow(cells: [
// //               DataCell(Text('#' + book['id'].toString())),
// //               DataCell(Text(book['title'])),
// //               DataCell(Text(book['author']))
// //             ]))
// //         .toList();
// //   }
// // }

// import 'dart:html';
// import 'package:animate_do/animate_do.dart';
// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:learning3_meal_app/model/invoices.dart';
// import 'package:learning3_meal_app/pages/invoice.dart';
// // import 'package:shoes_shop_ui/consts.dart';
// // import 'package:shoes_shop_ui/models/shoes_model.dart';

// //main page

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {

//   late TabController _controller;
//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 1, vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundcolor: Colors.Colors.grey[200],
//         appBar: AppBar(
//           backgroundcolor: Colors.Colors.transparent,
//           elevation: 0,
//           title: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               'shop',
//               style: TextStyle(color: Colors.Colors.black, fontSize: 16),
//             ),
//           ),
//           actions: [
//             GestureDetector(
//               // onTap: () {
//               //   Navigator.push(context,
//               //       MaterialPageRoute(builder: (context) => const MyCart()));
//               // },
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20, right: 10),
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.money,
//                       color: Colors.bleu,
//                       size: 28,
//                     ),
//                     const SizedBox(
//                       width: 3,
//                     ),
//                     Text(
//                       'Pay',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.bleu),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (context) => const MyFavorite()));
//                 // Navigator.pop(context);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20, right: 30),
//                 child: true
//                     ? Badge(
//                         badgeContent: Text(
//                           // favouriteitems.length.toString(),
//                           "itmes to string",
//                           style: TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w900,
//                               color: Colors.white),
//                         ),
//                         child: const Icon(
//                           Icons.favorite,
//                           color: Colors.Colors.black,
//                           size: 28,
//                         ),
//                       )
//                     : const Icon(
//                         Icons.favorite,
//                         color: Colors.Colors.black,
//                         size: 28,
//                       ),
//               ),
//             ),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               TabBar(
//                   controller: _controller,
//                   unselectedLabelStyle: TextStyle(fontSize: 12),
//                   labelStyle: TextStyle(fontSize: 12),
//                   indicator: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20), color: Colors.bleu),
//                   unselectedLabelcolor: Colors.Color.fromARGB(255, 235, 29, 29), tabs: [],
//                   tabs: const [
//                     // Tab(
//                     //   text: 'All',
//                     // ),
//                     // Tab(
//                     //   text: 'printers',
//                     // ),
//                     // Tab(
//                     //   text: 'service',
//                     // ),
//                     // Tab(
//                     //   text: '',
//                     // ),
//                   ]

//                   ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Expanded(
//                 child: TabBarView(controller: _controller, children: [
//                   _buildlistitem(items: allshoes),
//                   _buildlistitem(items: sportshoeslist),
//                   _buildlistitem(items: menshoeslist),
//                 ]
//                 ),
//                 // child: [_buildlistitem(items: sportshoeslist)],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildlistitem({required List<Invoices> items}) {
//     return GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         physics: const BouncingScrollPhysics(),
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return true
//               ? BounceInLeft(
//                   duration: const Duration(milliseconds: 1000),
//                   child: _builditem(myitems: items, index: index))
//               : BounceInRight(
//                   duration: const Duration(milliseconds: 1000),
//                   child: _builditem(myitems: items, index: index));
//         });
//   }

//   Widget _builditem({required List<ShoesModel> myitems, required int index}) {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //         builder: (_) => DetailsPage(
//         //             item: myitems[index],
//         //            )));
//       },
//       child: AspectRatio(
//         aspectRatio: 3 / 2.3,
//         child: Container(
//           margin: const EdgeInsets.all(15),
//           decoration: BoxDecoration(
//               color: Colors.Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: const [
//                 BoxShadow(
//                     blurRadius: 10, color: Colors.Colors.grey, offset: Offset(0, 10))
//               ]),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Stack(
//               children: [
//                 const Center(
//                   // child: Image.asset(
//                   //   myitems[index].img,
//                   //   fit: BoxFit.contain,
//                   //   width: 130,
//                   //    height: 200,
//                   // ),
//                   child: Text("hello world"),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             // setState(() {
//                             //   myitems[index].isselected =
//                             //       !myitems[index].isselected;
//                             // });
//                             // myitems[index].isselected
//                             //     ? favouriteitems.add(myitems[index])
//                             //     : favouriteitems.remove(myitems[index]);
//                           },
//                           child: Icon(
//                             Icons.favorite_sharp,
//                             color:
//                                 myitems[index].isselected ? Colors.red : white,
//                             size: 30,
//                           ),
//                         )
//                       ],
//                     ),
//                     // const SizedBox(
//                     //   height: 8,
//                     // ),
//                     // const Spacer(),
//                     // const Spacer(),
//                     // Text(
//                     //   '${myitems[index].price} \$',
//                     //   style: TextStyle(
//                     //       fontSize: 22, fontWeight: FontWeight.bold),
//                     // ),
//                     //  Text(
//                     //   myitems[index].company,
//                     //   style: TextStyle(
//                     //       fontSize: 18, fontWeight: FontWeight.normal,color: Colors.Colors.black),
//                     // ),
//                     //   Text(
//                     //   myitems[index].name,
//                     //   style: TextStyle(
//                     //       fontSize: 22, fontWeight: FontWeight.bold,color: Colors.Colors.black),
//                     // ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ShoesModel {
//   get isselected => null;
// }

// ignore_for_file: non_constant_identifier_names, unused_element, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gcg_ec/model/product.dart';
import 'package:http/http.dart' as http;

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as htmldom;

//main page

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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
    _controller =
        TabController(animationDuration: Duration.zero, length: 3, vsync: this);
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
                'shop',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            actions: [
              GestureDetector(
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const MyCart()));
                // },
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, right: 20),
                  child: Row(
                      // children: const [
                      //    Icon(
                      //     Icons.money,
                      //     color: Colors.blue,
                      //     size: 28,
                      //   ),
                      //   SizedBox(
                      //     width: 3,
                      //   ),
                      //   Text(
                      //     'Pay',
                      //     style: TextStyle(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w900,
                      //         color: Colors.blue),
                      //   )
                      // ],
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
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TabBar(
                          controller: _controller,
                          unselectedLabelStyle: const TextStyle(fontSize: 12),
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
                        child: TabBarView(controller: _controller, children: [
                          _buildlistitem(items: productList),
                          _buildlistitem(items: productList),
                          _buildlistitem(items: productList),

                          // Text("hello"),
                          // Text("hello"),
                          // Text("hello")
                        ]),
                      )
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
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (_) => detailsPage(
        //               item: myitems[index],
        //             )));
      },
    );
  }
}
