import 'package:flutter/material.dart';
import 'package:food_app/drinkDatabase.dart';
class Insert_Drink extends StatefulWidget {
  const Insert_Drink({Key? key}) : super(key: key);

  @override
  _Insert_DrinkState createState() => _Insert_DrinkState();
}

class _Insert_DrinkState extends State<Insert_Drink> {

  TextEditingController _name   = TextEditingController();
  TextEditingController _price  = TextEditingController();
  TextEditingController _image  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          'Insert Drink',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.local_drink,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Drink Name',
                    hintStyle: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller:_price,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.money,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Price',
                    hintStyle: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller:_image,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Image',
                    hintStyle: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child:
                    ElevatedButton(onPressed: () {
                      var name  = _name.text as String;
                      var image = _image.text as String;
                      var price = double.parse(_price.text) as double;
                      DrinkDatabase.insertDatabase(image: image, price: price, name: name);
                      DrinkDatabase.getDate(DrinkDatabase.database);
                      print('Accpted');
                    },
                        child: Text('Save'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
