// ignore_for_file: camel_case_types, unused_field, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/storeid.dart';

class Sidemenu30_3 extends StatefulWidget {
  const Sidemenu30_3({Key? key}) : super(key: key);

  @override
  State<Sidemenu30_3> createState() => _Sidemenu30_3State();
}

late Future<List<ProductId>> productStoreData;
var productList;
Future<List<ProductId>> fetchProducts() async {
  var url = "http://172.29.1.208:2016/api/products?storeid=11";
  var response = await Dio().get(url);
  if (response.statusCode == 200) {
    var getUsersData = response.data as List;
    productList = getUsersData.map((i) {
      return ProductId.fromJson(i);
    }).toList();
    return productList;
  } else {
    throw Exception('Failed to load users');
  }
}


class _Sidemenu30_3State extends State<Sidemenu30_3> {
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        // body: filterPage(),
        
        
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       width: MediaQuery.of(context).size.width / 3,
        //       height: double.infinity,
        //       decoration: BoxDecoration(
        //         color: Colors.red,
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey.withOpacity(0.5),
        //             spreadRadius: 5,
        //             blurRadius: 7,
        //             offset: const Offset(0, 3), // changes position of shadow
        //           ),
        //         ],
        //       ),
        //       child: ParentView(),
        //     ),
        //     Container(
        //       width: MediaQuery.of(context).size.width / 2,
        //       height: double.infinity,
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey.withOpacity(0.5),
        //             spreadRadius: 5,
        //             blurRadius: 7,
        //             offset: const Offset(0, 3), // changes position of shadow
        //           ),
        //         ],
        //       ),
        //        child: childView(),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget ParentView() {
    final _controller = ScrollController();
    return SingleChildScrollView(
      controller: _controller,
      child: Column(children: [
        // ListView.builder(
        //   itemBuilder: (context, index) {
        //     return const Text("hello");
        //   },
        //   itemCount: 20,
        // )

        FutureBuilder<List<ProductId>>(
          future: fetchProducts(),
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
        ),
      ]),
    );
  }
}

class MyExpansionTileList extends StatefulWidget {
  late BuildContext context;
  final List<ProductId> elementList;

  MyExpansionTileList({required this.elementList});

  @override
  State<StatefulWidget> createState() => _DrawerState();
}

class _DrawerState extends State<MyExpansionTileList> {
  List<Widget> _getChildren1(final List<ProductId> elementList) {
// ----------------------------------------------------
    var name = {};
    var name1 = {};

    for (ProductId item in elementList) {
      if (item.attributes!.isNotEmpty &&
          item.attributes![0].values![0].name != "Inkjet" &&
          item.attributes![0].values![0].name != "Laser" &&
          item.attributes![0].values!.isNotEmpty) {
        name[item.attributes![0].values![0].valuedisplayorder] =
            item.attributes![0].values![0].name;
      }

      for (var attrItems in item.attributes!) {
        name1[attrItems.attributedisplayorder] = attrItems.name;
      }
    }

    Map<dynamic, dynamic> sorting(Map<dynamic, dynamic> value) {
      return Map.fromEntries(
          value.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    }

    name1 = sorting(name1);
    name = sorting(name);

// ----------------------------------------------------

    List<Widget> children = [];
    int selected = 0;
    final subMenuChildren = <Widget>[];
    try {
      for (MapEntry value in name1.entries) {
        children.add(
          ListTile(
            title: Text(
              "${value.value}",
              // style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            //  children: subMenuChildren,
            onTap: () {
              childView(value.key);
            },
          ),
        );
      }
    } catch (err) {
      print('Caught error: $err');
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getChildren1(widget.elementList),
    );
  }

  @override
  void initState() {
    super.initState();
  }







Widget childView(int value) {
  final _controller = ScrollController();
  return ListView.builder(
    itemBuilder: (context, index) {
      return const Text("hello");
    },
    itemCount: value,
  );
}

}













