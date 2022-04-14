// import 'package:flutter/material.dart';



// // Multi Select widget
// // This widget is reusable
// class MultiSelect extends StatefulWidget {
//   final List<String> items;
//   const MultiSelect({Key? key, required this.items}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _MultiSelectState();
// }

// class _MultiSelectState extends State<MultiSelect> {
//   // this variable holds the selected items
//   final List<String> _selectedItems = [];

// // This function is triggered when a checkbox is checked or unchecked
//   void _itemChange(String itemValue, bool isSelected) {
//     setState(() {
//       if (isSelected) {
//         _selectedItems.add(itemValue);
//       } else {
//         _selectedItems.remove(itemValue);
//       }
//     });
//   }

//   // this function is called when the Cancel button is pressed
//   void _cancel() {
//     Navigator.pop(context);
//   }

// // this function is called when the Submit button is tapped
//   void _submit() {
//      Navigator.pop(context, _selectedItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Select Topics'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: widget.items
//               .map((item) => CheckboxListTile(
//                     value: _selectedItems.contains(item),
//                     title: Text(item),
//                     controlAffinity: ListTileControlAffinity.leading,
//                     onChanged: (isChecked) => _itemChange(item, isChecked!),
//                   ))
//               .toList(),
//         ),
//       ),
//       actions: [
//         TextButton(
//           child: const Text('Cancel'),
//           onPressed: _cancel,
//         ),
//         ElevatedButton(
//           child: const Text('Submit'),
//           onPressed: _submit,
//         ),
//       ],
//     );
//   }
// }

// // Implement a multi select on the Home screen
// class DropDownPage extends StatefulWidget {
//   const DropDownPage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<DropDownPage> {
//   List<String> _selectedItems = [];

//   void _showMultiSelect() async {
//     // a list of selectable items
//     // these items can be hard-coded or dynamically fetched from a database/API
//     final List<String> _items = [
//       'Flutter',
//       'Node.js',
//       'React Native',
//       'Java',
//       'Docker',
//       'MySQL'
//     ];

//     final List<String>? results = await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return MultiSelect(items: _items);
//       },
//     );

//     // Update UI
//     if (results != null) {
//       setState(() {
//         _selectedItems = results;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('KindaCode.com'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // use this button to open the multi-select dialog
//             ElevatedButton(
//               child: const Text('Select Your Favorite Topics'),
//               onPressed: _showMultiSelect,
//             ),
//             const Divider(
//               height: 30,
//             ),
//             // display selected items
//             Wrap(
//               children: _selectedItems
//                   .map((e) => Chip(
//                         label: Text(e),
//                       ))
//                   .toList(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class DropDownPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DropDownPage> {
  static final List<Animal?> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal?>(animal, animal!.name))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List<Animal> _selectedAnimals2 = [];
  List<Animal?> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  List<Animal?> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _animals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dropdown with plugin "),
      ),
      // drawer: Drawer(child: Column(
      //      children: <Widget>[
      //         const SizedBox(height: 40),
      //         //################################################################################################
      //         // Rounded blue MultiSelectDialogField
      //         //################################################################################################
      //         MultiSelectDialogField(
      //           items: _items,
      //           title: const Text("Animals"),
      //           selectedColor: Colors.blue,
      //           decoration: BoxDecoration(
      //             color: Colors.blue.withOpacity(0.1),
      //             borderRadius: const BorderRadius.all(Radius.circular(40)),
      //             border: Border.all(
      //               color: Colors.blue,
      //               width: 2,
      //             ),
      //           ),
      //           buttonIcon: const Icon(
      //             Icons.pets,
      //             color: Colors.blue,
      //           ),
      //           buttonText: Text(
      //             "Favorite Animals",
      //             style: TextStyle(
      //               color: Colors.blue[800],
      //               fontSize: 16,
      //             ),
      //           ),
      //           onConfirm: (results) {
      //            // _selectedAnimals = results as List<Animal?>;
      //           },
      //         ),
      // ])),
      
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            
            children: <Widget>[
              

              const SizedBox(height: 40),

              //################################################################################################
              // Rounded blue MultiSelectDialogField
              //################################################################################################
              
              Container(

                decoration:
                    const BoxDecoration(border: Border(right: BorderSide(width: 1))),
                child: MultiSelectDialogField(
                  
                  items: _items,
                  title: const Text("Animals"),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  buttonIcon: const Icon(
                    Icons.pets,
                    color: Colors.blue,
                  ),
                  buttonText: Text(
                    "Favorite Animals",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {
                   // _selectedAnimals = results as List<Animal?>;
                  },
                ),
              ),

        
              // const SizedBox(height: 50),
              //################################################################################################
              // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
              // decoration applied. This allows the ChipDisplay to render inside the same Container.
              //################################################################################################
              // Container(
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).primaryColor.withOpacity(.4),
              //     border: Border.all(
              //       color: Theme.of(context).primaryColor,
              //       width: 2,
              //     ),
              //   ),
              //   child: Column(
              //     children: <Widget>[
              //       MultiSelectBottomSheetField(
              //         initialChildSize: 0.4,
              //         listType: MultiSelectListType.CHIP,
              //         searchable: true,
              //         buttonText: const Text("Favorite Animals"),
              //         title: const Text("Animals"),
              //         items: _items,
              //         onConfirm: (values) {
              //           _selectedAnimals2 = values as List<Animal>;
              //         },
              //         chipDisplay: MultiSelectChipDisplay(
              //           onTap: (value) {
              //             setState(() {
              //               _selectedAnimals2.remove(value);
              //             });
              //           },
              //         ),
              //       ),
              //       _selectedAnimals2.isEmpty
              //           ? Container(
              //               padding: const EdgeInsets.all(10),
              //               alignment: Alignment.centerLeft,
              //               child: const Text(
              //                 "None selected",
              //                 style: TextStyle(color: Colors.black54),
              //               ))
              //           : Container(),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 40),
              //################################################################################################
              // MultiSelectBottomSheetField with validators
              //################################################################################################
              // MultiSelectBottomSheetField<Animal?>(
              //   key: _multiSelectKey,
              //   initialChildSize: 0.7,
              //   maxChildSize: 0.95,
              //   title: const Text("Animals"),
              //   buttonText: const Text("Favorite Animals"),
              //   items: _items,
              //   searchable: true,
              //   validator: (values) {
              //     if (values == null || values.isEmpty) {
              //       return "Required";
              //     }
              //     List<String> names = values.map((e) => e!.name).toList();
              //     if (names.contains("Frog")) {
              //       return "Frogs are weird!";
              //     }
              //     return null;
              //   },
              //   onConfirm: (values) {
              //     setState(() {
              //     _selectedAnimals3 = values;
              //     });
              //     _multiSelectKey.currentState?.validate();
              //   },
              //   chipDisplay: MultiSelectChipDisplay(
              //     onTap: (item) {
              //       setState(() {
              //       _selectedAnimals3.remove(item);
              //       });
              //       _multiSelectKey.currentState?.validate();
              //     },
              //   ),
              // ),
              // const SizedBox(height: 40),
              //################################################################################################
              // MultiSelectChipField
              //################################################################################################
              // MultiSelectChipField(
              //   items: _items,
              //   // initialValue: [_animals[4], _animals[7], _animals[9]],
              //   title: const Text("Animals"),
              //   headerColor: Colors.blue.withOpacity(0.5),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.blue, width: 1.8),
              //   ),
              //   selectedChipColor: Colors.blue.withOpacity(0.5),
              //   selectedTextStyle: TextStyle(color: Colors.blue[800]),
              //   onTap: (values) {
              //     //_selectedAnimals4 = values;
              //   },
              // ),
              // const SizedBox(height: 40),
              //################################################################################################
              // MultiSelectDialogField with initial values
              //################################################################################################
              // MultiSelectDialogField(
              //   onConfirm: (val) {
              //     _selectedAnimals5 = val as List<Animal?>;
              //   },
              //   dialogWidth: MediaQuery.of(context).size.width * 0.7,
              //   items: _items,
              //   initialValue:
              //       _selectedAnimals5, // setting the value of this in initState() to pre-select values.
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
