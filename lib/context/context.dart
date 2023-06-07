import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Item {
  final String _name;
  int _quantity;
  bool _checked;

  Item(this._name, this._quantity, this._checked);

  String get name => _name;
  int get quantity => _quantity;
  bool get checked => _checked;

  void setQuantity(int newQuantity) {
    _quantity = newQuantity;
  }

  void setChecked(bool newChecked) {
    _checked = newChecked;
  }
}

class userList {
  final List<Item> itens;

  userList(this.itens);
}

class DataProvider with ChangeNotifier {
  userList _lista = userList([
    Item('Item 1', 2, false),
    Item('Item 2', 3, false),
    Item('Item 3', 1, false),
  ]);

  userList get lista => _lista;

  void addItem(Item item) {
    _lista.itens.add(item);
    notifyListeners();
  }
}
