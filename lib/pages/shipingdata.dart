import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../api/All_get_api.dart';
import '../model/Oshipment.dart';
import '../model/user.dart';
import 'detailPages/shipmentdetails.dart';

class ShipmentData extends StatefulWidget {
  const ShipmentData({Key? key}) : super(key: key);

  @override
  State<ShipmentData> createState() => _ShipmentDataState();
}

class _ShipmentDataState extends State<ShipmentData> {
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
          //  scrollDirection: Axis.vertical,
          //  physics: ScrollPhysics(),
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
                        "SHIPMENT",
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
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 1.0, color: Colors.black26))),
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
                                    minWidth: 600,
                                    columns: const [
                                      DataColumn2(
                                        label: Text(
                                          'DELIVERY NO.',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26)),
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        label: Text(
                                          'STATUS',
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
                                          'DELIVERY DATE',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26)),
                                        ),
                                        // size: ColumnSize.M,
                                        // numeric: true,
                                      ),
                                      DataColumn2(
                                        label: Text(
                                          'SHIP TO ADDRESS',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26)),
                                        ),
                                        size: ColumnSize.L,
                                        // numeric: true,
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        snapshot.data![0].userShipment!
                                            .oShipment!.length, (index) {
                                      var user =
                                          (snapshot.data as List<User>)[0];

                                      final userShipment = user.userShipment!
                                          .oShipment as List<OShipment>;
                                      var date =
                                          // userShipment[index].lASTUPDATEDATE;
                                          DateFormat.yMd().format(
                                              DateTime.parse(userShipment[index]
                                                  .lASTUPDATEDATE
                                                  .toString()));

                                      var data1 = DateFormat('dd-MM-yyyy');

                                      return DataRow(
                                          color:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => states.contains(
                                                          MaterialState.hovered)
                                                      ? Colors.amber
                                                      : index % 2 == 0
                                                          ? Color.fromARGB(255,
                                                              252, 252, 252)
                                                          : Color.fromARGB(255,
                                                              228, 228, 228)),
                                          cells: [
                                            DataCell(
                                              Text(
                                                '${userShipment[index].dELIERYNAME}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        201, 63, 81, 181),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              onTap: () {
                                                print("pressed${index}");
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ShipmentDetail(
                                                              itemIndex: index,
                                                            )));
                                              },
                                            ),
                                            DataCell(Text(
                                              '${userShipment[index].sTATUSNAME}'
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      202, 38, 38, 38)),
                                            )),
                                            DataCell(Text(
                                              // '${userShipment[index].dELIERYNAME}-items'
                                              '$date',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      202, 38, 38, 38)),
                                            )),
                                            DataCell(Text(
                                              '${userShipment[index].shipToAddress}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      202, 38, 38, 38)),
                                            )),
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
