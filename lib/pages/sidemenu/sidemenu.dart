// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_new, prefer_const_constructors, curly_braces_in_flow_control_structures, must_be_immutable, prefer_const_constructors_in_immutables, unused_field, camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers, unused_local_variable, avoid_print


import 'package:gcg_ec/model/categoryApi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

var _selectedPageIndex;
late List<Widget> _pages;
PageController? _pageController;

class Controller extends GetxController {
  var title = "Dashboard".obs;
}

class sidemenu extends StatefulWidget {
  @override
  _sidemenuState createState() => new _sidemenuState();
}


class _sidemenuState extends State<sidemenu> {
  late Future<List<categoryApi>> _responseFuture;

Future<List<categoryApi>> fetchUsers() async {
  var url = "http://172.29.1.208:2016/api/Categories?storeid=11";
  var response = await Dio().get(url);
  if (response.statusCode == 200) {
    var getUsersData = response.data as List;

    List<categoryApi> listUsers = [];

    for (var i in getUsersData) {
     if(i != null){
        listUsers.add(categoryApi.fromJson(i));
     }
    }

    return listUsers;
  } else {
    throw Exception('Failed to load users');
  }
}
  @override
  void initState() {
    print("initstate");
    super.initState();
    _responseFuture = fetchUsers();
    _selectedPageIndex = 0;
    _pages = [
      // it is important to keep these indices number so you will find it easier to reference them whne you want to open them
      // 0
      Dashboard(),
      // 1
      Receipts(),
      // 2
      FundSource(),
      // 3
      GFSCodes()
    ];
    // initiating a page controller
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    // dispose the page controller
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());

    return GetMaterialApp(
      title: 'demo for side menu and navigation',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        // Obx(() => Text(c.title.value))
        appBar: AppBar(title: Text("hello World")),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _pages,
        ),
        drawer: createDrawer(context,_responseFuture),
      ),
    );
  }
}

// class MyExpansionTile extends StatefulWidget {
//   // final int did;
//   // final String name;
//   //MyExpansionTile(this.did, this.name, {Key? key}) : super(key: key);
//   @override
//   State createState() => MyExpansionTileState();
// }

// class MyExpansionTileState extends State<MyExpansionTile> {
//   late PageStorageKey _key;
//   late Future<List<categoryApi>> _responseFuture;
//   String? title;

//   @override
//   void initState() {
//     super.initState();
//     _responseFuture = fetchUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title.toString())),
//       body: const Center(
//           child: Text(
//         '',
//         style: TextStyle(fontSize: 20.0),
//       )),
//       drawer: Drawer(
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const UserAccountsDrawerHeader(
//               accountName: Text(""),
//               accountEmail: Text(""),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.orange,
//                 child: Text(
//                   "",
//                   style: TextStyle(fontSize: 40.0),
//                 ),
//               ),
//             ),
//             ExpansionTile(
//               leading: Icon(
//                 Icons.audiotrack,
//                 color: Color.fromARGB(255, 80, 226, 85),
//                 size: 30.0,
//               ),
//               title: Text(
//                 'items.playerName',
//                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//               ),
//               children: <Widget>[
//                 ListTile(
//                   leading: Visibility(
//                     child: Icon(
//                       Icons.ac_unit,
//                       size: 15,
//                     ),
//                     visible: false,
//                   ),
//                   onTap: () => {},
//                   title: Text(
//                     'items.description',
//                     style: TextStyle(fontWeight: FontWeight.w700),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// String _currentRoute = "/";
//void doRoute(BuildContext context, String name) {
// if (_currentRoute != name)
//   Navigator.pushReplacementNamed(context, name);
// else
//   Navigator.pop(context);
// _currentRoute = name;
//}

Widget createDrawer(
    BuildContext context, Future<List<categoryApi>> _responseFuture)

 {
  final _controller = ScrollController();

  return Drawer(
    child: SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: <Widget>[
          FutureBuilder<List<categoryApi>>(
            future: _responseFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var json = snapshot.data!;
                return MyExpansionTileList(elementList: json);
              } else {
                return const Center(
                  child: Text('Loading...'),
                );
              }
            },
          )
        ],
      ),
    ),
  );
}

class MyExpansionTileList extends StatefulWidget {
  late BuildContext context;
  final List<categoryApi> elementList;

  MyExpansionTileList({required this.elementList});

  @override
  State<StatefulWidget> createState() => _DrawerState();
}

class _DrawerState extends State<MyExpansionTileList> {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  // final Controller c = Get.find();

  List<Widget> _getChildren(final List<categoryApi> elementList) {
    List<Widget> children = [];
    int selected = 0;
    final subMenuChildren = <Widget>[];
    try {
      for (var i = 0; i < elementList.length; i++) {
        subMenuChildren.add(new ListTile(
          // leading: Visibility(
          //   child: Icon(
          //     Icons.account_box_rounded,
          //     size: 15,
          //   ),
          //   visible: false,
          // ),
          onTap: () => {
            setState(() {
              print("The item clicked is " + elementList[i].name.toString());

              // switch (element['children'][i]['state']) {
              //   case '/fund-type':
              //     //setting current index and opening a new screen using page controller with animations
              //     _selectedPageIndex = 1;
              //     WidgetsBinding.instance?.addPostFrameCallback((_) {
              //       if (_pageController!.hasClients) {
              //         _pageController?.animateToPage(1,
              //             duration: Duration(milliseconds: 1),
              //             curve: Curves.easeInOut);
              //       }
              //     });
              //     c.title.value = "Fund Type";
              //     Navigator.pop(context);

              //     break;
              //   case '/fund-sources':
              //     _selectedPageIndex = 2;
              //     // _pageController.jumpToPage(2);
              //     WidgetsBinding.instance!.addPostFrameCallback((_) {
              //       if (_pageController!.hasClients) {
              //         _pageController!.animateToPage(2,
              //             duration: Duration(milliseconds: 1),
              //             curve: Curves.easeInOut);
              //       }
              //     });
              //     c.title.value = "Fund Source";

              //     Navigator.pop(context);

              //     break;
              // }
            })
          },
          title: Text(
            elementList[i].name.toString(),
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          trailing: Text(
            elementList[i].items.toString(),
          ),
        ));
      }
      children.add(
        ExpansionTile(
          //key: Key(index.toString()),
          //initiallyExpanded: index == selected,
          // leading: Icon(
          //   Icons.audiotrack,
          //   color: Colors.green,
          //   size: 30.0,
          // ),
          title: Text(
            "Category",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          children: subMenuChildren,
          // onExpansionChanged: ((newState) {
          //   if (newState) {
          //     // Duration(seconds: 20000);
          //     print('if statement');
          //     print(selected);
          //     selected = index;
          //     log(' selected ' + index.toString());
          //   } else {
          //     selected = -1;
          //     log(' selected ' + selected.toString());
          //   }
          // }),
        ),
      );
    } catch (err) {
      print('Caught error: $err');
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: _getChildren(widget.elementList),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class GFSCodes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FundSource extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("this is a Fund Source"),
    );
  }
}

class Receipts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("this is a Dashboard"),
    );
  }
}
