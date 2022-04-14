// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';


import '../../api/All_get_api.dart';
import '../../model/Oshipment.dart';
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
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          "Shipment Detail Page",
          textScaleFactor: 1.2,
        )),
        body: FutureBuilder<List<User>>(
            future: apiData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                        snapshot.data![0].userShipment!.oShipment![value]
                            .oShipmentline!.length, (index) {
                      var user = (snapshot.data as List<User>)[0];

                      final shipmentline = user.userShipment!.oShipment![value]
                          .oShipmentline as List<OShipmentline>;

                      return DataRow(cells: [
                        DataCell(
                          Text('${shipmentline[index].iTEMDESCRIPTION}'),
                        ),
                        DataCell(Text('${shipmentline[index].oDELIVERYID}')),
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
    );
  }
}
