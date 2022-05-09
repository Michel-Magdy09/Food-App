import 'package:flutter/material.dart';
import 'SandwichesDatabase.dart';
import 'drinkDatabase.dart';
import 'usersDatabase.dart';
//provider name is Testcart ****************************************************

class Testcart with ChangeNotifier {
  List<Item> _items = [];
  List<Item> sandwichList = SandwichDatabase.data;
  List<Item> drinkList    = DrinkDatabase.data;
  List<User> usersList    = UsersDatabase.data;
  double _price = 0.0;
  bool validData = true;
  void add(Item item) {
    print('From provider : ${sandwichList.length} ');
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }
  void delete(Item item) {
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }
  int get count {
    return _items.length;
  }
  double get totalprice {
    return _price;
  }
  List<Item> get basketItem {
    return _items;
  }

  void changefalse()
  {
      validData=false;
      notifyListeners();
  }

  void changetrue()
  {
    validData=true;
    notifyListeners();
  }
}
class Item{
  final String name ;
  final double price ;
  final String image;
  Item({required this.name , required this.price ,required this.image}) ;
}


class User{
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  User({required this.name,required this.email,required this.password,required this.phoneNumber});

}
