import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gcg_ec/model/salesOrder.dart';
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
    var apiData = api.FetchUsers(data);

    return MaterialApp(
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
                      Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "Sales Order Page",
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
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
                            border:
                                Border(top: BorderSide(width: 1.0, color: Colors.black26))),
                        child: FutureBuilder<List<salesOrderApi>>(
                            future: apiData,
                            builder: (context, snapshot) {
                              print(snapshot);
                              if (snapshot.hasData) {
                                return DataTable2(
                               
                                    dataRowHeight: 45,
                                    //  dividerThickness: 2,
                                    columnSpacing: 20,
                                    //
                                    horizontalMargin: 30,
                                    
                                    minWidth: 700,
                        
                                    // horizontalMargin: 30,
                                    // minWidth: 100,
                                    columns: const [
                                      DataColumn(
                                        label: Text('DELIVERY NO.'),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn(
                                        label: Text('STATUS'),
                                        //  size: ColumnSize.M,
                                      ),
                                      DataColumn(
                                        label: Text('DELIVERY DATE'),
                                        //  size: ColumnSize.L,
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('SHIP TO ADDRESS'),
                                        size: ColumnSize.L,
                                        
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text('SHIP TO ADDRESS'),
                                         size: ColumnSize.M,
                                        // numeric: true,
                                      ),
                                      DataColumn(
                                        label: Text('SHIP TO ADDRESS'),
                                        // size: ColumnSize.M,
                                        // numeric: true,
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        snapshot.data![0].data!.length, (index) {
                                      var user = (snapshot.data![0].data as List<Data>);
                                      // final user =
                                      //     user.user!.oShipment as List<OShipment>;
                                
                                      return DataRow(cells: [
                                        DataCell(
                                          Text('${user[index].orderId}'),
                                          onTap: () {
                                            print("pressed${index}");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => ShipmentDetail(
                                                          itemIndex: index,
                                                        )));
                                          },
                                        ),
                                        DataCell(Text('${user[index].oRDERNUMBER}')),
                                        DataCell(Text('${user[index].storeName}')),
                                        DataCell(Text('${user[index].sCITY}')),
                                        DataCell(Text(
                                            "${user[index].oRDERSTATUS}")),
                                        DataCell(Text('${user[index].sALESPEROSN}')),
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
