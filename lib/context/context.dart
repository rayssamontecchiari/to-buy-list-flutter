import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Item {
  final String _name;
  final String _id;
  int _quantity;
  bool _checked;

  Item(this._name, this._quantity, this._checked) : _id = Uuid().v4();

  String get name => _name;
  String get id => _id;
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
  userList _lista = userList([]);

  userList get lista => _lista;

  void addItem(Item item) {
    _lista.itens.add(item);
    notifyListeners();
  }

  void removeItem(String itemId) {
    _lista.itens.removeWhere((item) => item._id == itemId);
    notifyListeners();
  }

  void removeAllItens() {
    _lista.itens.clear();
    notifyListeners();
  }
}
