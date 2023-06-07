import 'package:flutter/material.dart';

class viewList extends StatefulWidget {
  final List<Map<String, Object>> currentList;

  viewList({Key? key, required this.currentList}) : super(key: key);

  @override
  _viewListState createState() => _viewListState();
}

class _viewListState extends State<viewList> {
  final _userList = [
    {"name": "banana", "quantity": 2, "checked": false},
    {"name": "limao", "quantity": 1, "checked": true},
    {"name": "pera", "quantity": 5, "checked": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Minha Lista"),
        ),
        body: SafeArea(
          child: Column(children: [
            const Text(
              "Aqui está sua lista",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Column(
              children: _userList.map((i) {
                String itemName = i["name"].toString();
                String itemQuantity = i["quantity"].toString();
                bool itemChecked = i["checked"] as bool;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Checkbox(
                      value: itemChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          itemChecked = value!;
                        });
                      },
                    ),
                    Text(itemName),
                    Text("  --  "),
                    Text(itemQuantity)
                  ],
                );
              }).toList(),
            )
          ]),
        ));
  }
}
