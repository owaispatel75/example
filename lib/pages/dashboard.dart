import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../api/All_get_api.dart';
import '../model/orders.dart';
import '../model/user.dart';
import 'detailPages/enquiryDetails.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    var data = "http://172.29.1.208:2016/api/CustomerDetails/47";
    var api = getData();
    var apiData = api.fetchUsers(data);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        //     title: const Text(
        //   "dashboard Page",
        //   textScaleFactor: 1.2,
        // ),
         backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
               const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Dashboard page",
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(199, 26, 26, 26)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              SingleChildScrollView(
                controller: ScrollController(),
                child: Container(
                  margin: const EdgeInsets.all(20),
                   decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1.0, color: Colors.black26))),
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
                                  5, (index) {
                                var user = (snapshot.data as List<User>)[0];
                                final userOrderlist =
                                    user.userOrder!.orders as List<Orders>;
                      
                                return DataRow(cells: [
                                  DataCell(
                                    Text('${userOrderlist[index].orderNumber}',
                                     style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(201, 63, 81, 181),
                                          fontWeight: FontWeight.w500),
                                    
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
