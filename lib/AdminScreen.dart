import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Insert_Drink.dart';
import 'Insert_Sandwich.dart';
import 'Show_User.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List<String> data = ['Insert Sandwich', 'Insert Drink', 'Show User'];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.grey[850],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey,
            title: const Text(
              "Admin Page",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      if(index==0){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Insert_Sandwich()));
                      }
                      else if(index==1){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Insert_Drink()));
                      }
                      else{
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Show_User()));
                      }
                    },
                    title: Text(
                      data[index] ,
                    ),
                  ),
                );
              }));
    }
  }
