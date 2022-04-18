import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gcg_ec/pages/detailPages/enquiryDetails.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../api/All_get_api.dart';
import '../model/Oshipment.dart';
import '../model/orders.dart';
import '../model/user.dart';
import 'detailPages/shipmentdetails.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    var data = "http://172.29.1.208:2016/api/CustomerDetails/121";
    var api = getData();
    var apiData = api.fetchUsers(data);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(0),
                  color: Colors.white, //Theme.of(context).primaryColor,
                  // border: Border.all(color: Colors.black26),
                ),
                margin: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),

                        /*Border(
                             top: BorderSide(
                                  width: 1.0, color: Colors.black26)) */
                      ),
                      child: FutureBuilder<List<User>>(
                          future: apiData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DataTable2(
                                dataRowHeight: 45,
                                //  dividerThickness: 2,
                                columnSpacing: 20,

                                //
                                horizontalMargin: 20,
                                minWidth: 550,
                                columns: const [
                                  DataColumn2(
                                    label: Text(
                                      'CREDIT AMOUNT',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(199, 26, 26, 26)),
                                    ),
                                    size: ColumnSize.S,
                                  ),
                                  DataColumn2(
                                    label: Text(
                                      'BALANCE DUE',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(199, 26, 26, 26)),
                                    ),
                                    size: ColumnSize.S,
                                  ),
                                  DataColumn2(
                                    label: Text(
                                      'BALANCE CREDIT AMOUNT',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(199, 26, 26, 26)),
                                    ),
                                    size: ColumnSize.M,
                                    // numeric: true,
                                  ),
                                ],
                                rows: <DataRow>[
                                  DataRow(cells: [
                                    DataCell(Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(202, 38, 38, 38)),
                                    )),
                                    DataCell(Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(202, 38, 38, 38)),
                                    )),
                                    DataCell(Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(202, 38, 38, 38)),
                                    )),
                                  ])
                                ],
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.red,
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 22),
                            child: Text(
                              "Recent Enquiry",
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(199, 26, 26, 26)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 1.0, color: Colors.black26))),
                            child: FutureBuilder<List<User>>(
                                future: apiData,
                                builder: (context, snapshot) {
                                  print(snapshot);
                                  if (snapshot.hasData) {
                                    return DataTable2(
                                        columnSpacing: 10,
                                        horizontalMargin: 20,
                                        minWidth: 380,
                                        columns: const [
                                          DataColumn2(
                                            label: Text(
                                              'ENQUIRY NO',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      199, 26, 26, 26)),
                                            ),
                                            size: ColumnSize.M,
                                          ),
                                          DataColumn2(
                                              label: Text(
                                                'ENQUIRY DATE',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        199, 26, 26, 26)),
                                              ),
                                              size: ColumnSize.L),
                                          DataColumn2(
                                            label: Text(
                                              'TOTAL ITEMS',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      199, 26, 26, 26)),
                                            ),
                                            // numeric: true,
                                          ),
                                          /*   DataColumn(
                                    label: Text('index Value'),
                                    numeric: true,
                                  ),
                                  */
                                        ],
                                        rows:
                                            List<DataRow>.generate(5, (index) {
                                          var user =
                                              (snapshot.data as List<User>)[0];
                                          final userOrderlist = user.userOrder!
                                              .orders as List<Orders>;

                                          return DataRow(
                                              color: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      states.contains(
                                                              MaterialState
                                                                  .hovered)
                                                          ? Colors.amber
                                                          : index % 2 == 0
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  252,
                                                                  252,
                                                                  252)
                                                              : Color.fromARGB(
                                                                  255,
                                                                  228,
                                                                  228,
                                                                  228)),
                                              cells: [
                                                DataCell(
                                                  Text(
                                                    '#'
                                                    '${userOrderlist[index].orderNumber}',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.indigo,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    DetailsPage(
                                                                      itemIndex:
                                                                          index,
                                                                    )));
                                                  },
                                                ),
                                                DataCell(Text(
                                                    '${userOrderlist[index].orderDate}',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ))),
                                                DataCell(Text(
                                                  '${userOrderlist[index].totalItems}-items',
                                                  //textDirection: TextDirection.ltr,
                                                  //textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                                // DataCell(Text('$index')),
                                              ]);
                                        }));
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
