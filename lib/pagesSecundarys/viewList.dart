import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/context/context.dart';
import 'package:todo_list/pagesSecundarys/addItem.dart';

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

    int qtdItens = _userList.length;

    String titleItens =
        _userList.length <= 1 ? '$qtdItens item' : '$qtdItens itens';

    String title = _userList.length > 0 ? titleItens : "Sua lista esta vazia";

    String? _dropdownValue = "Ordenar aqui";

    void sortList(String? newSelected) {
      setState(() {
        _dropdownValue = newSelected;

        switch (newSelected) {
          case ('Ordem alfabética'):
            _userList.sort((a, b) => a.name.compareTo(b.name));

          case ('Marcados'):
            _userList.sort((a, b) => a.checked ? -1 : 1);

          case ('Não Marcados'):
            _userList.sort((a, b) => a.checked ? 1 : -1);

          case ('Não Marcados'):
            _userList.sort((a, b) => a.quantity.compareTo(b.quantity));
        }
      });
    }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.amber,
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => addItemsToList(),
                      ),
                    )
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    child: const Text("Adicionar Itens",
                        style: TextStyle(color: Colors.white)),
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
              ],
            ),
            if (_userList.length > 0)
              InkWell(
                highlightColor: Colors.red[400],
                onTap: () {
                  final dataProvider =
                      Provider.of<DataProvider>(context, listen: false);

                  dataProvider.removeCheckeds();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  child: Text("Excluir itens marcados",
                      style: TextStyle(color: Colors.red[400])),
                ),
              ),
            if (_userList.length > 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text("Ordenar aqui"),
                        value: "Ordenar aqui",
                      ),
                      DropdownMenuItem(
                        child: Text("Ordem alfabética"),
                        value: "Ordem alfabética",
                      ),
                      DropdownMenuItem(
                        child: Text("Marcados"),
                        value: "Marcados",
                      ),
                      DropdownMenuItem(
                        child: Text("Não Marcados"),
                        value: "Não Marcados",
                      ),
                    ],
                    value: _dropdownValue,
                    onChanged: (value) => sortList(value),
                    // isExpanded: true,
                    style: const TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemCount: _userList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _userList[index];
                  return ListTile(
                    leading: Checkbox(
                      value: item.checked,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            item.setChecked(value);
                          });
                        }
                      },
                    ),
                    title: Text(item.name),
                    subtitle: Text('Quantidade: ${item.quantity}'),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        final dataProvider =
                            Provider.of<DataProvider>(context, listen: false);

                        dataProvider.removeItem(item.id);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
