import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../api/All_get_api.dart';
import '../model/orders.dart';
import '../model/user.dart';
import 'detailPages/enquiryDetails.dart';

class Enquiry extends StatefulWidget {
  const Enquiry({Key? key}) : super(key: key);

  @override
  State<Enquiry> createState() => _EnquiryState();
}

class _EnquiryState extends State<Enquiry> {
  @override
  Widget build(BuildContext context) {
    var data = "http://172.29.1.208:2016/api/CustomerDetails/47";
    var api = getData();
    var apiData = api.fetchUsers(data);

    return Scaffold(
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
                  border: Border.all(color: Colors.black26)),
              margin: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: Text(
                      "ENQUIRY",
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
                            top:
                                BorderSide(width: 1.0, color: Colors.black26))),
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
                                          color:
                                              Color.fromARGB(199, 26, 26, 26)),
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
                                          color:
                                              Color.fromARGB(199, 26, 26, 26)),
                                    ),
                                    // numeric: true,
                                  ),
                                  /*   DataColumn(
                                    label: Text('index Value'),
                                    numeric: true,
                                  ),
                                  */
                                ],
                                rows: List<DataRow>.generate(
                                    snapshot.data![0].userOrder!.orders!.length,
                                    (index) {
                                  var user = (snapshot.data as List<User>)[0];
                                  final userOrderlist =
                                      user.userOrder!.orders as List<Orders>;

                                  return DataRow(
                                      color: MaterialStateProperty.resolveWith(
                                          (states) => states.contains(
                                                  MaterialState.hovered)
                                              ? Colors.amber
                                              : index % 2 == 0
                                                  ? Color.fromARGB(
                                                      255, 252, 252, 252)
                                                  : Color.fromARGB(
                                                      255, 228, 228, 228)),
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
                                                    builder: (context) =>
                                                        DetailsPage(
                                                          itemIndex: index,
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
    );
  }
}
