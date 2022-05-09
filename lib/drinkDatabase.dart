import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'Items.dart';
import 'ProviderScreen.dart';
import 'main.dart';

class DrinkDatabase {

  // price double , image string , name string

  static late Database database;
  static List<Item> data =[];


  static Future<void> creatDatabase()async{

    database = await openDatabase(
        'drink.db',
        version: 1,
        onCreate: (database, version){
          print ("Database is created !!");

          database.execute(
              'CREATE TABLE drink (id INTEGER PRIMARY KEY, name text, price REAL , image text)'
          ).
          then((value) {
            print('TABLE IS CREATED !!');

          }).
          catchError((error){
            print(error.toString());
          });
        },
        onOpen: (database){
          print ('Database is open !!');
          getDate(database);
        }
    );
  }

  static Future<void> getDate(Database database) async{
    data.clear();
    database.rawQuery(
        'SELECT * FROM drink'
    ).
    then((value) {
      value.forEach((element){
        data.add(
            Item(
              price: element['price'] as double,
              name: element['name']as String,
              image: element['image']as String,
            )
        );
      }
      );
      print('From getData function Length is : ${data.length}');
    }).catchError((error){
      print(error.toString());
    });
  }


  static Future<void> insertDatabase({required String image,required double price,required String name})async{

    database.rawInsert(
        'INSERT INTO drink (name, price ,image) VALUES ( ?, ? , ? )',[name,price,image]
    ).
    then((value) {
      print("Record $value is inserted !!");
      //getDate(database);
    }).catchError((error){
      print ( error.toString());
    });
  }

  static void updateDatabase(String name, double price , String image , int id){
    database.rawUpdate(
        'update table drink set name = ?, price =?, image = ?  where id = ?',[name,price,image,id]
    ).
    then((value){
      print(value);
    }).
    catchError((error){
      print(error.toString());
    });
  }

  static void deleteDatabase(int id){
    database.rawDelete(
        'DELETE FROM drink WHERE id = ?' ,[id]
    ).then((value){
      print(value);
    }).catchError((error){
      print(error.toString());
    });
  }

  static void deleteAllData() {
    for(int i = 1 ; i <= data.length ; i++)
    {
      deleteDatabase(i);
    }
    data.clear();
  }

  static void add()
  {
    insertDatabase(name: 'Chocolate Milkshake', price: 30, image: 'assets/cms.png');
    insertDatabase(name: 'Vanilla Milkshake', price: 30, image: 'assets/vms.png');
    insertDatabase(name: 'Strawberry Milkshake', price: 30, image: 'assets/sms.png');
    insertDatabase(name: 'Pepsi', price: 20, image: 'assets/cola.jpg');
    insertDatabase(name: 'Sprite', price: 20, image: 'assets/cola.jpg');
    insertDatabase(name: 'Fanta', price: 20, image: 'assets/cola.jpg');
    insertDatabase(name: 'Orange Juice', price: 25, image: 'assets/orng.png');
    insertDatabase(name: 'Americano', price: 35, image: 'assets/am.png');
    insertDatabase(name: 'Espresso', price: 25, image: 'assets/es.png');
    insertDatabase(name: 'Mochaccino', price: 35, image: 'assets/moc.png');
    insertDatabase(name: 'Tea', price: 35, image: 'assets/tea.png');
    insertDatabase(name: 'Cappuccino', price: 35, image: 'assets/cap.png');
  }

}