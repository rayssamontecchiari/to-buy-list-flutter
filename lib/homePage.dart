import 'package:flutter/material.dart';
import 'package:todo_list/pagesSecundarys/addItem.dart';
import 'package:todo_list/pagesSecundarys/viewList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userList = [
    {"name": "banana", "quantity": 2},
    {"name": "limao", "quantity": 1},
    {"name": "pera", "quantity": 5}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lista"),
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Selecione o que deseja fazer com sua lista",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      highlightColor: Colors.amber,
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      addItemsToList(currentList: _userList),
                                ))
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
                      )),
                  InkWell(
                      highlightColor: Colors.amber,
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      viewList(currentList: _userList),
                                ))
                          },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors
                                  .amber, // Define a cor da borda como vermelho
                              width:
                                  2, // Define a largura da borda como 2 pixels
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Ver lista",
                            style: TextStyle(color: Colors.amber),
                          ))),
                ],
              )
            ]),
      ),
    );
  }
}
