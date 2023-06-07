import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/context/context.dart';
import 'package:todo_list/pagesSecundarys/viewList.dart';

class addItemsToList extends StatefulWidget {
  addItemsToList({Key? key}) : super(key: key);

  @override
  _addItemsToListState createState() => _addItemsToListState();
}

class _addItemsToListState extends State<addItemsToList> {
  TextEditingController _controllerInputName = TextEditingController();
  TextEditingController _controllerInputQuantity = TextEditingController();

  @override
  void dispose() {
    _controllerInputName.dispose();
    _controllerInputQuantity.dispose();
    super.dispose();
  }

  String _newItemName = '';
  int _newItemQtd = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lista"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              const Text(
                "Insira o nome do produto e a quantidade desejada",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controllerInputName,
                        decoration: const InputDecoration(
                            labelText: 'Nome do produto',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.amber),
                            )),
                        onChanged: (value) {
                          setState(() {
                            _newItemName = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _controllerInputQuantity,
                        decoration: const InputDecoration(
                          labelText: 'Quantidade',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _newItemQtd =
                                int.parse(value) > 0 ? int.parse(value) : 0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<DataProvider>(builder: (context, dataProvider, _) {
                return InkWell(
                  onTap: () => {
                    setState(() {
                      final dataProvider =
                          Provider.of<DataProvider>(context, listen: false);
                      Item _newListItem =
                          Item(_newItemName, _newItemQtd, false);

                      dataProvider.addItem(_newListItem);
                    }),
                  },
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Adicionar",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }),
                );
              }),
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => viewList(),
                    ),
                  )
                },
                child: LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.amber,
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Ver lista",
                      style: TextStyle(color: Colors.amber),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
