import 'package:flutter/material.dart';
import 'ProviderScreen.dart';
import 'package:provider/provider.dart';
import './items.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0 , 50, 0),
                  child: Text("The Cart" , style: TextStyle(fontSize: 27),),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.shopping_cart_outlined),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Consumer<Testcart>(
                  builder: (context, testcart, child) {
                    return Text("${testcart.totalprice} LE");
                  }, // the counter of cart
                ),
              ),
            ],
          ),

          backgroundColor: const Color(0X8000CED1),
        ),
        body: Consumer<Testcart>(builder: (context, testcart, child) {
          return ListView.builder(
            itemCount: testcart.basketItem.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text(testcart.basketItem[i].name),
                  trailing: IconButton(
                      onPressed: () {
                        testcart.delete(testcart.basketItem[i]);
                      },
                      icon: const Icon(Icons.remove_circle)),
                ),
              );
            },
          );
        }));
  }
}

