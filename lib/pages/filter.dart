// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, avoid_types_as_parameter_names, avoid_unnecessary_containers, prefer_const_constructors, unused_element, non_constant_identifier_names, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gcg_ec/pages/ytfilter.dart';
import '../model/storeid.dart';

class productStoreData extends StatefulWidget {
  @override
  State<productStoreData> createState() => _productStoreData();
}

class _productStoreData extends State<productStoreData> {
  late Future<List<ProductId>> productStoreData;
  var productList;
  Future<List<ProductId>> fetchUsers() async {
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

  @override
  void initState() {
    super.initState();
    productStoreData = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("productStoredata")),
          body: FutureBuilder<List<ProductId>>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var name = {};
                var name1 = {};

                for (ProductId item in snapshot.data!) {
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
                  return Map.fromEntries(value.entries.toList()
                    ..sort((e1, e2) => e1.key.compareTo(e2.key)));
                }

                name1 = sorting(name1);

                name = sorting(name);

                var arrays = [];

                name1.values.forEach((v) {
                  arrays.add(v);
                });

                print(name1);
                print(name);

                return VerticalTabs(
                  tabs: arrays
                      .map((e) => Tab(
                            child: Text("$e"),
                          ))
                      .toList(),
                  contents: [
                    Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                            Text('HTML 1'),
                          ],
                        ), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 2'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 3'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 4'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 6'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 8'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 9'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 10'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 11'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 12'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 13'), padding: EdgeInsets.all(20)),
                    Container(
                        child: Text('HTML 14'), padding: EdgeInsets.all(20)),
                          Container(
                        child: Text('HTML 15'), padding: EdgeInsets.all(20)),
                          Container(
                        child: Text('HTML 16'), padding: EdgeInsets.all(20)),
                  ],
                );

                // ListView.separated(
                //     itemBuilder: (context, index) {
                //       var product_Data =
                //           (snapshot.data as List<ProductId>)[index];
                //       return Container(
                //         child: Text(""),
                //       );
                //     },
                //     separatorBuilder: (context, index) {
                //       return Divider();
                //     },
                //     itemCount: (snapshot.data as List<ProductId>).length);
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
              return const Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.cyanAccent),
              );
            },
          )),
    );
  }
}
