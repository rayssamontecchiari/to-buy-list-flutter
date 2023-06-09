import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/context/context.dart';
import 'package:todo_list/pagesSecundarys/addItem.dart';
import 'package:todo_list/pagesSecundarys/viewList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                "Selecione o que deseja fazer com sua lista",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
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
                InkWell(
                  highlightColor: Colors.amber,
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => viewList(),
                      ),
                    )
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.amber,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Ver lista",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
