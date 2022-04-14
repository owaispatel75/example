// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:badges/badges.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../api/All_get_api.dart';
import '../model/invoices.dart';
import '../model/user.dart';

class InvoicePage extends StatefulWidget {
  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<InvoicePage> {

  var data = "http://172.29.1.208:2016/api/CustomerDetails/121";
  var api = getData();

  @override
  bool get wantKeepAlive => true;

  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        TabController(animationDuration: Duration.zero, length: 3, vsync: this)
          ..addListener(() {
            if (_controller.indexIsChanging) {
              // setState(() =>  );
              print(_controller.index);
            }
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var apiData = api.fetchUsers(data);
    var BalancedAmount = 1000;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Invoice',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        actions: [
          GestureDetector(
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const MyCart()));
            // },
            child: FutureBuilder<List<User>>(
                future: apiData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    double total = 0;
                    var user = (snapshot.data as List<User>)[0];
                    final userInvoice =
                        user.userinvoices!.invoices as List<Invoices>;
                    for (var k in userInvoice) {
                      if (k.amountDueRemaining != 0) {
                        total += k.amountDueRemaining;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 20, right: 10),
                      child: Row(
                        children: [
                          Text(
                            'Total Invoice $total',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Colors.blue),
                          )
                        ],
                      ),
                    );
                  }
                  return Text("Total Invoice");
                }),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
                controller: _controller,
                unselectedLabelStyle: TextStyle(fontSize: 12),
                labelStyle: TextStyle(fontSize: 12),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                tabs: const [
                  Tab(
                    text: 'Open',
                  ),
                  Tab(
                    text: 'Closed',
                  ),
                  Tab(
                    text: 'Monthly Invoice',
                  ),
                ]),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(controller: _controller, children: [
                // _buildlistitem(items: allshoes),
                // _buildlistitem(items: sportshoeslist),
                // _buildlistitem(items: menshoeslist),
                _builditemOpen(),
                _builditemClosed(),
                _builditemOpen(),
              ]),
              // child: [_buildlistitem(items: sportshoeslist)],
            )
          ],
        ),
      ),
    ));
  }

// Widget _buildlistitem({required List<ShoesModel> items}) {
  Widget _builditemOpen() {
    var apiData = api.fetchUsers(data);
    return FutureBuilder<List<User>>(
        future: apiData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var user = (snapshot.data as List<User>)[0];
            final userInvoice = user.userinvoices!.invoices as List<Invoices>;
            List<Invoices> list = [];
            for (var k in userInvoice) {
              if (k.amountDueRemaining == 0) {
                list.add(k);
              }
            }

            return SafeArea(
              child: DataTable2(
                  columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.5,
                  dataRowHeight: 80,
                  // horizontalMargin: 30,
                  // minWidth: 100,
                  columns: const [
                    DataColumn2(
                      label: Text('INVOICE NO.'),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('DATE'),
                      size: ColumnSize.M,
                    ),
                    DataColumn2(
                      label: Text('DUE DATE'),
                      size: ColumnSize.L,
                      numeric: true,
                    ),
                    DataColumn2(
                      label: Text('AMOUNT'),
                      size: ColumnSize.M,
                      numeric: true,
                    ),
                    DataColumn2(
                      label: Text('BALANCED'),
                      size: ColumnSize.M,
                      numeric: true,
                    ),
                  ],
                  rows: List<DataRow>.generate(list.length, (index) {
                    // print(snapshot.data![0].userinvoices!.invoices![index]
                    //     .amountDueRemaining);

                    return DataRow(cells: [
                      DataCell(
                        Text('#${list[index].invoiceNumber}'),
                        onTap: () {
                          print("pressed${index}");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ShipmentDetail(
                          //               itemIndex: index,
                          //             )));
                        },
                      ),
                      DataCell(SizedBox(
                          width: (MediaQuery.of(context).size.width / 10) * 3,
                          child: Text('${list[index].invoiceDate}'))),
                      DataCell(SizedBox(
                          width: (MediaQuery.of(context).size.width / 10) * 3,
                          child: Text('${list[index].invoiceDueDate}'))),
                      DataCell(Text('${list[index].invoiceAmount}')),
                      DataCell(Text('${list[index].amountDueRemaining}')),
                    ]);
                  })),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 231, 209, 12),
            ),
          );
        });
  }

  Widget _builditemClosed() {
    var apiData = api.fetchUsers(data);
    return FutureBuilder<List<User>>(
        future: apiData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var user = (snapshot.data as List<User>)[0];
            final userInvoice = user.userinvoices!.invoices as List<Invoices>;
            List<Invoices> list = [];
            for (var k in userInvoice) {
              if (k.amountDueRemaining != 0) {
                list.add(k);
              }
            }

            return SafeArea(
              child: DataTable2(
                  columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.5,
                  dataRowHeight: 80,
                  // horizontalMargin: 30,
                  // minWidth: 100,
                  columns: const [
                    DataColumn2(
                      label: Text('INVOICE NO.'),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('DATE'),
                      size: ColumnSize.M,
                    ),
                    DataColumn2(
                      label: Text('DUE DATE'),
                      size: ColumnSize.L,
                      numeric: true,
                    ),
                    DataColumn2(
                      label: Text('AMOUNT'),
                      size: ColumnSize.M,
                      numeric: true,
                    ),
                    DataColumn2(
                      label: Text('BALANCED'),
                      size: ColumnSize.M,
                      numeric: true,
                    ),
                  ],
                  rows: List<DataRow>.generate(list.length, (index) {
                    // print(snapshot.data![0].userinvoices!.invoices![index]
                    //     .amountDueRemaining);

                    return DataRow(cells: [
                      DataCell(
                        Text('#${list[index].invoiceNumber}'),
                        onTap: () {
                          print("pressed${index}");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ShipmentDetail(
                          //               itemIndex: index,
                          //             )));
                        },
                      ),
                      DataCell(SizedBox(
                          width: (MediaQuery.of(context).size.width / 10) * 3,
                          child: Text('${list[index].invoiceDate}'))),
                      DataCell(SizedBox(
                          width: (MediaQuery.of(context).size.width / 10) * 3,
                          child: Text('${list[index].invoiceDueDate}'))),
                      DataCell(Text('${list[index].invoiceAmount}')),
                      DataCell(Text('${list[index].amountDueRemaining}')),
                    ]);
                  })),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 231, 209, 12),
            ),
          );
        });
  }
}
