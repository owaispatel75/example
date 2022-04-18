// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gcg_ec/model/salesOrderLineApi.dart';

import '../../api/All_get_api.dart';
import '../../model/Oshipment.dart';
import '../../model/salesOrder.dart';
import '../../model/user.dart';

class SalesOrderDetails extends StatefulWidget {
  final itemIndex;

  const SalesOrderDetails({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  @override
  State<SalesOrderDetails> createState() => _SalesOrderDetailsState();
}

class _SalesOrderDetailsState extends State<SalesOrderDetails> {
  @override
  Widget build(BuildContext context) {
    var value = widget.itemIndex;

    var data = "http://172.29.1.208:2016/api/GetSalesOrderLine";
    var api = getData3();
    var apiData = api.fetchUsers(data);

    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    border: Border.all(color: Colors.black26)),
                margin: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "Details Order",
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
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.black26))),
                      child: FutureBuilder<List<salesOrderDetailsApi>>(
                          future: apiData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<SalesOrderDetailsData> salesOrderDetailList =
                                  [];
                              salesOrderDetailList
                                  .map((salesorderSelectedList) {
                                if (salesorderSelectedList == value) {
                                  print(salesorderSelectedList);
                                  salesOrderDetailList
                                      .add(salesorderSelectedList);
                                }
                              });

                              return DataTable2(
                                  columnSpacing: 20,
                                  horizontalMargin: 30,
                                  minWidth: 100,
                                  columns: const [
                                    DataColumn2(
                                      label: Text('Item Description'),
                                      size: ColumnSize.L,
                                    ),
                                    DataColumn(
                                      label: Text('Sales Order No'),
                                    ),
                                    // DataColumn(
                                    //   label: Text('Total Items'),
                                    //   numeric: true,
                                    // ),
                                    // DataColumn(
                                    //   label: Text('index Value'),
                                    //   numeric: true,
                                    // ),
                                  ],
                                  rows: List<DataRow>.generate(
                                      salesOrderDetailList.length, (index) {
                                    return DataRow(cells: [
                                      DataCell(
                                        Text(
                                            '${salesOrderDetailList[index].iTEMDESCRIPTION}'),
                                      ),
                                      DataCell(Text(
                                          '${salesOrderDetailList[index].cURRENCY}')),
                                      // DataCell(
                                      //     Text('${userOrderlist[index].totalItems}-items')),
                                      // DataCell(Text('${index}')),
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
      ),
    );
  }
}
