import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AdminScreen.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'NavigationDarwerWidget.dart';
import 'ProviderScreen.dart';
import 'RegisterScreen.dart';
import 'SandwichesDatabase.dart';
import 'Show_User.dart';
import 'UsersDatabase.dart';
import 'drinkDatabase.dart';

class Show_User extends StatefulWidget {
  Show_User({Key? key}) : super(key: key);

  @override
  _Show_UserState createState() => _Show_UserState();
}

class _Show_UserState extends State<Show_User> {
  @override



   List <User> p = UsersDatabase.data;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Show Users',
        ),
      ),
      body: ListView.builder(
        itemCount: p.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(p[index].name),
              leading: Icon(Icons.account_box),
              subtitle: Text(p[index].email),
              trailing: Text(p[index].phoneNumber),
            ),
          );
        },

      ),
      );
  }
}
