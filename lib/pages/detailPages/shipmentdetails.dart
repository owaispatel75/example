// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../api/All_get_api.dart';
import '../../model/Oshipment.dart';
import '../../model/orders.dart';
import '../../model/user.dart';

class ShipmentDetail extends StatefulWidget {
  final itemIndex;

  const ShipmentDetail({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  @override
  State<ShipmentDetail> createState() => _ShipmentDetailState();
}

class _ShipmentDetailState extends State<ShipmentDetail> {
  @override
  Widget build(BuildContext context) {
    var value = widget.itemIndex;

    var data = "http://172.29.1.208:2016/api/CustomerDetails/121";
    var api = getData();
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
                    color: Colors.white,
                    border: Border.all(color: Colors.black26)),
                margin: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                          elevation: 0.2,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back to Shipping',
                            style: TextStyle(fontSize: 10),
                          ),
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, bottom: 10),
                          child: Text(
                            "Delivery No: ",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(199, 26, 26, 26)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: const Border(
                              top: const BorderSide(
                                  width: 1.0, color: Colors.black26))),
                      child: FutureBuilder<List<User>>(
                          future: apiData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DataTable2(
                                  columnSpacing: 15,
                                  horizontalMargin: 20,
                                  minWidth: 750,
                                  dataRowHeight: 90,
                                  columns: const [
                                    DataColumn2(
                                      label: Text(
                                        'Item Description',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.L,
                                    ),

                                    DataColumn2(
                                      label: Text(
                                        'Serial No',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.S,
                                    ),

                                    DataColumn2(
                                      label: Text(
                                        'Quantity',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.S,
                                    ),

                                    DataColumn2(
                                        label: Text(
                                          'Sales Or.No',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26)),
                                        ),
                                        size: ColumnSize.S),

                                    DataColumn2(
                                      label: Text(
                                        'PO Number',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.M,
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
                                      snapshot
                                          .data![0]
                                          .userShipment!
                                          .oShipment![value]
                                          .oShipmentline!
                                          .length, (index) {
                                    var user = (snapshot.data as List<User>)[0];

                                    final shipmentline = user
                                        .userShipment!
                                        .oShipment![value]
                                        .oShipmentline as List<OShipmentline>;

                                    return DataRow(
                                        color:
                                            MaterialStateProperty.resolveWith(
                                                (states) => states.contains(
                                                        MaterialState.hovered)
                                                    ? Colors.amber
                                                    : index % 2 == 0
                                                        ? Color.fromARGB(
                                                            255, 252, 252, 252)
                                                        : Color.fromARGB(255,
                                                            228, 228, 228)),
                                        cells: [
                                          DataCell(
                                            Text(
                                                '${shipmentline[index].iTEMDESCRIPTION}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          DataCell(
                                            Text(
                                                '${shipmentline[index].sERIALNUMBER}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          DataCell(
                                            Text(
                                                '${shipmentline[index].pICKEDQUANTITY}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          DataCell(
                                            Text(
                                                '${shipmentline[index].oDELIVERYID}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          DataCell(
                                            Text(
                                                // '${shipmentline[index].iTEMDESCRIPTION}',
                                                'ME- PO/0007/2021/ADMIN',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
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
