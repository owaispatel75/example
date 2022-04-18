import 'dart:convert';
import 'package:gcg_ec/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as htmldom;


//main page

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest>
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
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                          color: Color.fromARGB(255, 197, 197, 197),
                          width: 1.0,
                          style: BorderStyle.solid,
                        ))),
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Gulf Commercial Group Enterprise Solutions',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        wordSpacing: 1.0,
                                        fontSize: 15,
                                      )),
                                  SizedBox(
                                    height: 05,
                                  ),
                                  Text(
                                    'Established in 1982, The Digital Imaging & Office Services Solutions of Gulf Commercial Group was created to lead the Office Automation Solutions sector in the thriving UAE market. Today, GCG Enterprise Solutions delights an enviable list of distinguished clients with the most comprehensive portfolio of business information management technology in the region.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      wordSpacing: 1.0,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+971 4 5281000  ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                237, 54, 54, 54)),
                                      ),
                                      Text(
                                        '(MONDAY - FRIDAY)',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.home_work_rounded,
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'DUBAI OFFICE',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'phone: +971 4 5281000',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'Fax: +971 4 239 4566',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'P.O. Box 25940,',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'Makeen Building, Airport',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'Road, Deira, Dubai',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.email_sharp,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'info@gcg.ae',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.home_work_rounded,
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'ABU DHABI OFFICE',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'phone: +971 2 2014 999',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'Fax: +971 2 645 6483',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'P.O. Box 47257,',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'Shaheen Tower Building,',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'Abu Dubai',
                                            style: TextStyle(
                                              fontSize: 15.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.email_sharp,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'info@mps-uae.com',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
