import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import './items.dart';
import 'CartScreen.dart';
import 'ProviderScreen.dart';
import 'SandwichesDatabase.dart';

class Sandwich extends StatefulWidget {
  const Sandwich({Key? key}) : super(key: key);

  @override
  _SandwichState createState() => _SandwichState();
}

class _SandwichState extends State<Sandwich> {
  // List<Item> items = [
  //   Item(name: 'CheeseBurger', price: 18, image:'assets/tsty.jpg'),
  //   Item(name: 'Chicken Macdo', price: 15, image:'assets/macdo.png'),
  //   Item(name: 'Big Mac', price: 70, image:'assets/Bigmac.png'),
  //   Item(name: 'Chicken Mac', price: 72, image:'assets/chi.png'),
  //   Item(name: 'Little Tasty', price: 30, image:'assets/ltst.png'),
  //   Item(name: 'Big Tasty Chicken', price: 40, image:'assets/bigtsty.png'),
  //   Item(name: 'Grand Chicken Premier', price: 90, image:'assets/gcp.png'),
  //   Item(name: 'McChicken', price: 55, image:'assets/mcChick.png'),
  //   Item(name: 'Double McRoyal', price: 65, image:'assets/dmcroyal.png'),
  //   Item(name: 'Chicken Fillet Spicy', price: 50, image:'assets/fillet.png'),
  //   Item(name: 'Filet-O-Fish', price: 25, image:'assets/ff.png'),
  //   Item(name: 'Double Filet-O-Fish', price: 35, image:'assets/ff.png'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text(
          'Sandwiches',
          style: TextStyle(
              color: Color(0xFF29446B),
              fontSize: 40,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const Cart(),
                      ),
                    ),
                    icon: const Icon(Icons.add_shopping_cart)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
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
              itemCount: model.sandwichList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context ,index){
                return Card(
                    child:
                    Consumer<Testcart>(
                        builder: (context, testcart, child)
                        {
                          return
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(model.sandwichList[index].image),
                                  height: 100,
                                ),
                                SizedBox(
                                  child: Text(
                                    model.sandwichList[index].name,
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
                                      model.sandwichList[index].price.toString() + ' LE',
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
                                        testcart.add(model.sandwichList[index]);
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
        );
      }),
    );

  }
}

