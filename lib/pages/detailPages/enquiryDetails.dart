// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../../api/All_get_api.dart';
import '../../model/orders.dart';
import '../../model/user.dart';

class DetailsPage extends StatefulWidget {
  final  int  itemIndex;

  const DetailsPage({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var value = widget.itemIndex;

    var data = "http://172.29.1.208:2016/api/CustomerDetails/47";
    var api = getData();
    var apiData = api.fetchUsers(data);

    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Enquiry Detail Page",
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
                        label: Text('item Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('Product Description'),
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
                        snapshot.data![0].userOrder!.orders![value].items!.length,
                        (index) {
                      var user = (snapshot.data as List<User>)[0];
                      final userOrderlist =
                          user.userOrder!.orders![index].items as List<Items>;

                      return DataRow(cells: [
                        DataCell(
                          Text('${userOrderlist[index].name}'),
                        ),
                        DataCell(Text('${userOrderlist[index].oDESCRIPTION}')),
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
