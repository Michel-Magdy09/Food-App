import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/drinkDatabase.dart';
import 'package:provider/provider.dart';
import 'CartScreen.dart';
import 'ProviderScreen.dart';



class Drinks extends StatefulWidget {
  const Drinks({Key? key}) : super(key: key);

  @override
  _DrinksState createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  var mykey= GlobalKey<ScaffoldState>();
  // List<Item> items = [
  //   Item(name: 'Chocolate Milkshake', price: 30, image: 'assets/cms.png'),
  //   Item(name: 'Vanilla Milkshake', price: 30, image: 'assets/vms.png'),
  //   Item(name: 'Strawberry Milkshake', price: 30, image: 'assets/sms.png'),
  //   Item(name: 'Pepsi', price: 20, image: 'assets/cola.jpg'),
  //   Item(name: 'Sprite', price: 20, image: 'assets/cola.jpg'),
  //   Item(name: 'Fanta', price: 20, image: 'assets/cola.jpg'),
  //   Item(name: 'Orange Juice', price: 25, image: 'assets/orng.png'),
  //   Item(name: 'Americano', price: 35, image: 'assets/am.png'),
  //   Item(name: 'Espresso', price: 25, image: 'assets/es.png'),
  //   Item(name: 'Mochaccino', price: 35, image: 'assets/moc.png'),
  //   Item(name: 'Tea', price: 35, image: 'assets/tea.png'),
  //   Item(name: 'Cappuccino', price: 35, image: 'assets/cap.png'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text(
          'Drinks',
          style: TextStyle(
              color: Color(0xFF29446B),
              fontSize: 45,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const Cart(),
                      ),
                    ),
                    icon: const Icon(Icons.add_shopping_cart)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Consumer<Testcart>(
                  builder: (context, testcart, child) {
                    return Text("${testcart.count}");
                  }, // the counter of cart
                ),
              ),
            ],
          )
        ],
      ),
      body: Consumer<Testcart>(builder: (context,model,child){
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpeg'),
                fit: BoxFit.cover,
              )
          ),
          child: GridView.builder(
              itemCount: model.drinkList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context ,index){
                return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child:
                    Consumer<Testcart>(
                        builder: (context, testcart, child)
                        {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(model.drinkList[index].image),
                                height: 100,
                              ),
                              SizedBox(
                                child: Text(
                                  model.drinkList[index].name,
                                  style: const TextStyle(
                                      color: Color(0xFF29446B),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5),
                                ),
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    model.drinkList[index].price.toString() + ' LE',
                                    style: const TextStyle(
                                        color: Color(0xFF29446B),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.5),
                                  ),
                                  const SizedBox(
                                    width: 45,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      testcart.add(model.drinkList[index]);
                                    },

                                    backgroundColor: const Color(0xFFFFC809),
                                    mini: true,
                                    child: const Icon(
                                      Icons.add_shopping_cart,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        }
                    ));
              }
          ),
        ) ;
      }),
    );
  }
}