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

    String title =
        _userList.length > 0 ? "Aqui está sua lista" : "Sua lista esta vazia";

    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lista"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            if (_userList.length > 0)
              InkWell(
                highlightColor: Colors.red[400],
                onTap: () {
                  final dataProvider =
                      Provider.of<DataProvider>(context, listen: false);

                  dataProvider.removeAllItens();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  child: const Text("Limpar Listas",
                      style: TextStyle(color: Colors.white)),
                ),
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
                    Text(itemQuantity),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        final dataProvider =
                            Provider.of<DataProvider>(context, listen: false);

                        dataProvider.removeItem(i.id);
                      },
                    )
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
