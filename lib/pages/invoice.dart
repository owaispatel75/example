import 'package:badges/badges.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../api/All_get_api.dart';
import '../model/invoices.dart';
import '../model/user.dart';
import 'detailPages/invoicedetailclosed.dart';
import 'detailPages/invoicedetailopen.dart';

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
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            //elevation: 10,
            /*title: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Invoice',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ), */
            /*  actions: [
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
            ], */
          ),
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(

                  // borderRadius: BorderRadius.circular(0),
                  color: Colors.white, //Theme.of(context).primaryColor,
                  border: Border.all(color: Colors.black26)),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: Colors.black26))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 20, right: 10, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Invoice',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(199, 26, 26, 26)),
                          ),
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
                                    final userInvoice = user.userinvoices!
                                        .invoices as List<Invoices>;
                                    for (var k in userInvoice) {
                                      if (k.amountDueRemaining != 0) {
                                        total += k.amountDueRemaining;
                                      }
                                    }

                                    return Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Text(
                                            'Balance Due Amount: $total',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromARGB(
                                                    199, 26, 26, 26)),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                                  return Text("Balance Due Amount");
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TabBar(
                        physics: ScrollPhysics(),
                        indicatorPadding: EdgeInsets.only(
                            top: 4, bottom: 4, right: 2, left: 2),
                        controller: _controller,
                        isScrollable: true,
                        unselectedLabelStyle: TextStyle(fontSize: 16),
                        labelStyle: TextStyle(fontSize: 16),
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber),
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Expanded(
                      child: TabBarView(controller: _controller, children: [
                        // _buildlistitem(items: allshoes),
                        // _buildlistitem(items: sportshoeslist),
                        // _buildlistitem(items: menshoeslist),
                        _builditemOpen(),
                        _builditemClosed(),
                        _builditemOpen(),
                      ]),
                      // child: [_buildlistitem(items: sportshoeslist)],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

// Widget _buildlistitem({required List<ShoesModel> items}) {
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
              if (k.amountDueRemaining == 0) {
                list.add(k);
              }
            }

            return SafeArea(
              child: Container(
                // decoration: BoxDecoration(border: Border(width : 1, color: Colors.black26)),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1.0, color: Colors.black26))),
                child: DataTable2(
                    // columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.5,
                    //  dataRowHeight: 50,
                    // horizontalMargin: 30,
                    // minWidth: 100,
                    columnSpacing: 20,
                    horizontalMargin: 20,
                    minWidth: 580,
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
                        // numeric: true,
                      ),
                      DataColumn2(
                        label: Text('AMOUNT'),
                        size: ColumnSize.M,
                        // numeric: true,
                      ),
                      DataColumn2(
                        label: Text('BALANCED'),
                        size: ColumnSize.M,
                        // numeric: true,
                      ),
                    ],
                    rows: List<DataRow>.generate(list.length, (index) {
                      // print(snapshot.data![0].userinvoices!.invoices![index]
                      //     .amountDueRemaining);

                      return DataRow(
                          color: MaterialStateProperty.resolveWith(
                              (states) => states.contains(MaterialState.hovered)
                                  ? Colors.amber
                                  : index % 2 == 0
                                      ? Color.fromARGB(255, 252, 252, 252)
                                      : Color.fromARGB(255, 228, 228, 228)),
                          cells: [
                            DataCell(
                              Text(
                                '#${list[index].invoiceNumber}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.indigo,
                                ),
                              ),
                              onTap: () {
                                print("pressed${index}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InvoiceClosedDetail(
                                              itemIndex: index,
                                            )));
                              },
                            ),
                            DataCell(SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 10) *
                                        3,
                                child: Text('${list[index].invoiceDate}'))),
                            DataCell(SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 10) *
                                        3,
                                child: Text('${list[index].invoiceDueDate}'))),
                            DataCell(Text('${list[index].invoiceAmount}')),
                            DataCell(Text('${list[index].amountDueRemaining}')),
                          ]);
                    })),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 231, 209, 12),
            ),
          );
        });
  }

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
              if (k.amountDueRemaining != 0) {
                list.add(k);
              }
            }

            return SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1.0, color: Colors.black26))),
                child: DataTable2(
                    // columnSpacing:(MediaQuery.of(context).size.width / 10) * 0.5,
                    // dataRowHeight: 80,
                    // horizontalMargin: 30,
                    // minWidth: 100,

                    columnSpacing: 20,
                    horizontalMargin: 20,
                    minWidth: 600,
                    columns: const [
                      DataColumn2(
                        label: Text('INVOICE NO.'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('DATE'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('DUE DATE'),
                        size: ColumnSize.L,
                        //  numeric: true,
                      ),
                      DataColumn2(
                        label: Text('AMOUNT'),
                        size: ColumnSize.L,
                        //  numeric: true,
                      ),
                      DataColumn2(label: Text('BALANCED'), size: ColumnSize.L
                          // numeric: true,
                          ),
                    ],
                    rows: List<DataRow>.generate(list.length, (index) {
                      // print(snapshot.data![0].userinvoices!.invoices![index]
                      //     .amountDueRemaining);

                      return DataRow(
                          color: MaterialStateProperty.resolveWith(
                              (states) => states.contains(MaterialState.hovered)
                                  ? Colors.amber
                                  : index % 2 == 0
                                      ? Color.fromARGB(255, 252, 252, 252)
                                      : Color.fromARGB(255, 228, 228, 228)),
                          cells: [
                            DataCell(
                              Text(
                                '#${list[index].invoiceNumber}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.indigo,
                                ),
                              ),
                              onTap: () {
                                print("pressed${index}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InvoiceDetailPage(
                                              itemIndex: index,
                                            )));
                              },
                            ),
                            DataCell(SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 10) *
                                        3,
                                child: Text('${list[index].invoiceDate}'))),
                            DataCell(SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width / 10) *
                                        3,
                                child: Text('${list[index].invoiceDueDate}'))),
                            DataCell(Text('${list[index].invoiceAmount}')),
                            DataCell(Text('${list[index].amountDueRemaining}')),
                          ]);
                    })),
              ),
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
