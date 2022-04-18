import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gcg_ec/model/cart_model.dart';

//import 'package:shoes_shop_ui/consts.dart';

class counteritems extends StatefulWidget {
  const counteritems({Key? key}) : super(key: key);

  @override
  State<counteritems> createState() => _counteritemsState();
}

class _counteritemsState extends State<counteritems> {
  
  
  
  List<CartModel> boughtitems = [];
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border:
              Border.all(width: 0.3, color: Color.fromARGB(255, 29, 29, 29))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: _decrementCounter,
              child: Icon(
                Icons.remove,
                color: Colors.black,
                size: 16,
              )),
          SizedBox(
            width: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            child: Text(
              '$_counter',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
              onTap: _incrementCounter,
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 16,
              )),
        ],
      ),
    );
  }
}
