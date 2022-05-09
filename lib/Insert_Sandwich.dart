import 'package:flutter/material.dart';
import 'package:food_app/SandwichesDatabase.dart';

class Insert_Sandwich extends StatefulWidget {
  const Insert_Sandwich({Key? key}) : super(key: key);

  @override
  _Insert_SandwichState createState() => _Insert_SandwichState();
}

class _Insert_SandwichState extends State<Insert_Sandwich> {

  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _image = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          'Insert Sandwich',
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
                      Icons.restaurant,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)),
                    hintText: 'Sandwich Name',
                    hintStyle: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _price,
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
                controller: _image,
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
                    child: ElevatedButton(
                        onPressed: () {
                          var name = _name.text;
                          var image = _image.text;
                          var price = double.parse(_price.text) as double;
                          SandwichDatabase.insertDatabase(image: image, price: price, name: name);
                          print('Accepted');
                          SandwichDatabase.getDate(SandwichDatabase.database);
                        },
                        child: Text('Save')

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
