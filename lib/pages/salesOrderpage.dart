import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gcg_ec/model/salesOrder.dart';
import 'package:gcg_ec/pages/detailPages/salesDetail.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import '../api/All_get_api.dart';
import '../model/Oshipment.dart';
import '../model/user.dart';
import 'detailPages/shipmentdetails.dart';

class SalesOredrPage extends StatefulWidget {
  const SalesOredrPage({Key? key}) : super(key: key);

  @override
  State<SalesOredrPage> createState() => _SalesOredrPageState();
}

class _SalesOredrPageState extends State<SalesOredrPage> {
  // late LinkedScrollControllerGroup _controllers;
  // late ScrollController _bodyController;

  // @override
  // void initState() {
  //   super.initState();
  //   _controllers = LinkedScrollControllerGroup();
  //   _bodyController = _controllers.addAndGet();
  // }

  // @override
  // void dispose() {
  //   // ignore: todo
  //   // TODO: implement dispose
  //   super.dispose();
  //   // _bodyController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var data = "http://172.29.1.208:2016/api/GetSalesOrderHeader";
    var api = getData2();
    var apiData = api.fetchUsers(data);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          //     title: const Text(
          //   "SalesOrder Page",
          //   textScaleFactor: 1.2,
          // )
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
                        "Sales Order",
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
                    SingleChildScrollView(
                      controller: ScrollController(),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 1.0, color: Colors.black26))),
                        child: FutureBuilder<List<salesOrderApi>>(
                            future: apiData,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return DataTable2(
                                    columnSpacing: 15,
                                    horizontalMargin: 20,
                                    minWidth: 1200,
                                    dataRowHeight: 40,
                                    headingRowHeight: 75,
                                    smRatio: 0.65,
                                    lmRatio: 1.5,
                                    columns: const [
                                      DataColumn2(
                                        label: Text('DELIVERY\nNO.',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.S,
                                      ),
                                      DataColumn2(
                                        label: Text('DATE',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.S,
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('STATUS',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.S,
                                      ),
                                      DataColumn2(
                                        label: Text('SALES PERSON',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.L,
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('PAYMENT TERMS',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.M,

                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('PO NO.',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.M,
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('CURRENCY',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.S,
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('AMOUNT',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.S,
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('TAX',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.S,
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('TOTAL\nAMOUNT',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26))),
                                        size: ColumnSize.S,
                                        // numeric: true,
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        snapshot.data![0].data!.length,
                                        (index) {
                                      var user = (snapshot.data![0].data
                                          as List<Data>);
                                      // final user =
                                      //     user.user!.oShipment as List<OShipment>;

                                      return DataRow(cells: [
                                        DataCell(
                                          Text(
                                            '#${user[index].oRDERNUMBER}',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.indigo,
                                            ),
                                          ),
                                          onTap: () {
                                            print(user[index]
                                                .oRDERNUMBER
                                                .runtimeType);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SalesOrderDetails(
                                                          itemIndex: user[index]
                                                              .oRDERNUMBER,
                                                        )));
                                          },
                                        ),
                                        DataCell(
                                            Text('${user[index].oRDEREDDATE}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
                                        DataCell(
                                            Text('${user[index].oRDERSTATUS}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
                                        DataCell(
                                            Text('${user[index].sALESPEROSN}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
                                        DataCell(Text('${user[index].term}',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ))),
                                        DataCell(
                                            Text("${user[index].cUSTPONUMBER}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
                                        DataCell(
                                            Text('${user[index].cURRENCYCODE}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
                                        DataCell(
                                            Text('${user[index].oRDERAMOUNT}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
                                        DataCell(
                                            Text('${user[index].tAXAMOUNT}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
                                        DataCell(
                                            Text('${user[index].tOTALAMOUNT}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
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
