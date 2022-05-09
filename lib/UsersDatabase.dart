import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'Items.dart';
import 'ProviderScreen.dart';
import 'main.dart';

class UsersDatabase {

  // price double , image string , name string

  static late Database database;
  static List<User> data =[];


  static Future<void> creatDatabase()async{

    database = await openDatabase(
        'users.db',
        version: 1,
        onCreate: (database, version){
          print ("Database is created !!");

          database.execute(
              'CREATE TABLE users (id INTEGER PRIMARY KEY, name text, email text , phoneNumber text , password text )'
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
        'SELECT * FROM users'
    ).
    then((value) {
      value.forEach((element){
        data.add(
            User(
              name: element['name'] as String,
              email: element['email']as String,
              phoneNumber: element['phoneNumber']as String,
              password: element['password']as String
            )
        );
      }
      );
      print('From getData function Length is : ${data.length}');
    }).catchError((error){
      print(error.toString());
    });
  }


  static Future<void> insertDatabase({required String name,required String email,required String password,required String phoneNumber})async{

    database.rawInsert(
        'INSERT INTO users (name, email ,phoneNumber ,password) VALUES ( ?, ? , ?,? )',[name,email,phoneNumber,password]
    ).
    then((value) {
      print("Record $value is inserted !!");
      //getDate(database);
    }).catchError((error){
      print ( error.toString());
    });
  }

  static void updateDatabase({required String name,required String email,required String password,required int id}){
    database.rawUpdate(
        'update table users set name = ?, email =?, password = ?  where id = ?',[name,email,password,id]
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
        'DELETE FROM users WHERE id = ?' ,[id]
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

  static bool validData({required String name,required String password}) { // validData for login screen
      bool valid=false;
      List.generate(data.length, (index) {
        if(data[index].password == password && data[index].name == name )
          {
              valid=true;
          }
      });
      return valid;
  }

  static bool isFoundinDatabase({required String name,required String password})
  {
    int count=0;
    List.generate(data.length, (index) {
      if(data[index].password == password && data[index].name == name )
      {
         count++;
      }
    });
    if(count==0)return false;
    else return true;

  }

}