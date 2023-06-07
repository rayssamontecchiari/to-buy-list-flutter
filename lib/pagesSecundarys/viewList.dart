import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/context/context.dart';

class viewList extends StatefulWidget {
  viewList({Key? key}) : super(key: key);

  @override
  _viewListState createState() => _viewListState();
}

class _viewListState extends State<viewList> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final _userList = dataProvider.lista.itens;

    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lista"),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
                String itemName = i.name;
                String itemQuantity = i.quantity.toString();

                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Checkbox(
                      value: i.checked,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            i.setChecked(value);
                          });
                        }
                      },
                    ),
                    Text(itemName),
                    Text("  --  "),
                    Text(itemQuantity)
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
