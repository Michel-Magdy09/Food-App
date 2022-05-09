import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'Items.dart';
import 'ProviderScreen.dart';
import 'main.dart';

class SandwichDatabase {

  // price double , image string , name string

  static late Database database;
  static List<Item> data =[];


  static Future<void> creatDatabase()async{

    database = await openDatabase(
        'sandwich.db',
        version: 1,
        onCreate: (database, version){
          print ("Database is created !!");

          database.execute(
              'CREATE TABLE Sandwich (id INTEGER PRIMARY KEY, name text, price REAL , image text)'
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
        'SELECT * FROM Sandwich'
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
        'INSERT INTO Sandwich (name, price ,image) VALUES ( ?, ? , ? )',[name,price,image]
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
        'update table Sandwich set name = ?, price =?, image = ?  where id = ?',[name,price,image,id]
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
        'DELETE FROM Sandwich WHERE id = ?' ,[id]
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
    insertDatabase(name: 'CheeseBurger', price: 18, image:'assets/tsty.jpg');
    insertDatabase(name: 'Chicken Macdo', price: 15, image:'assets/macdo.png');
    insertDatabase(name: 'Big Mac', price: 70, image:'assets/Bigmac.png');
    insertDatabase(name: 'Chicken Mac', price: 72, image:'assets/chi.png');
    insertDatabase (name: 'Little Tasty', price: 30, image:'assets/ltst.png');
    insertDatabase(name: 'Big Tasty Chicken', price: 40, image:'assets/bigtsty.png');
    insertDatabase(name: 'Grand Chicken Premier', price: 90, image:'assets/gcp.png');
    insertDatabase(name: 'McChicken', price: 55, image:'assets/mcChick.png');
    insertDatabase(name: 'Double McRoyal', price: 65, image:'assets/dmcroyal.png');
    insertDatabase(name: 'Chicken Fillet Spicy', price: 50, image:'assets/fillet.png');
    insertDatabase(name: 'Filet-O-Fish', price: 25, image:'assets/ff.png');
    insertDatabase(name: 'Double Filet-O-Fish', price: 35, image:'assets/ff.png');
  }

}