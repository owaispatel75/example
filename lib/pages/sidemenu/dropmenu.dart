// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class categoryMenu extends StatefulWidget {
  @override
  State<categoryMenu> createState() => _categoryMenuState();
}

class _categoryMenuState extends State<categoryMenu> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  String selectedValue = "USA";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body:
          // DropdownButton(
          //   value: selectedValue,
          //   items: dropdownItems,
          //   // onChanged: null,
          //   // value:null.
          //   onChanged: (String? value) {
          //     setState(() {
          //       print(value);
          //       selectedValue = value!;
          //     });
          //   },
          // ),

          Center(
            child: DropdownButtonFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Colors.blueAccent,
        ),
        dropdownColor: Colors.blueAccent,
        value: selectedValue,
        onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
        },
        items: dropdownItems,
      ),
          ),
    ));
  }
}
