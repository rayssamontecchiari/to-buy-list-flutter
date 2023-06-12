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
  userList _lista = userList([
    Item('Abacaxi', 2, false),
    Item('Limão', 8, false),
    Item('Maçã', 5, false),
    Item('Banana', 3, false),
    Item('Melancia', 1, false),
    Item('Laranja', 4, false),
    Item('Pera', 6, false),
    Item('Uva', 2, false),
    Item('Morango', 1, false),
    Item('Kiwi', 3, false),
    Item('Manga', 2, false),
    Item('Abacate', 4, false),
    Item('Cenoura', 5, false),
    Item('Tomate', 3, false),
    Item('Batata', 6, false),
    Item('Cebola', 2, false),
    Item('Alho', 1, false),
    Item('Brócolis', 3, false),
    Item('Couve-flor', 2, false),
    Item('Pimentão', 4, false),
  ]);

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

  void removeCheckeds() {
    _lista.itens.removeWhere((item) => item._checked == true);
    notifyListeners();
  }
}
