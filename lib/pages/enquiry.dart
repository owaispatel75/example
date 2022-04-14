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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Enquiry Page",
          textScaleFactor: 1.2,
        )),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: FutureBuilder<List<User>>(
              future: apiData,
              builder: (context, snapshot) {
                print(snapshot);
                if (snapshot.hasData) {
                  return DataTable2(
                      columnSpacing: 10,
                      horizontalMargin: 30,
                      minWidth: 100,
                      columns: const [
                        DataColumn2(
                          label: Text('Enquiry No'),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Text('Enquiry Date'),
                        ),
                        DataColumn(
                          label: Text('Total Items'),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text('index Value'),
                          numeric: true,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          snapshot.data![0].userOrder!.orders!.length, (index) {
                        var user = (snapshot.data as List<User>)[0];
                        final userOrderlist =
                            user.userOrder!.orders as List<Orders>;

                        return DataRow(cells: [
                          DataCell(
                            Text('${userOrderlist[index].orderNumber}'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                            itemIndex: index,
                                          )));
                            },
                          ),
                          DataCell(Text('${userOrderlist[index].orderDate}')),
                          DataCell(
                              Text('${userOrderlist[index].totalItems}-items')),
                          DataCell(Text('$index')),
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
    );
  }
}
