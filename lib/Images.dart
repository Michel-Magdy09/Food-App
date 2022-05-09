import 'package:flutter/material.dart';
import 'item.dart';

class image extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
            ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  Item(
    "https://scontent.fcai19-3.fna.fbcdn.net/v/t39.30808-6/258386060_6690319414341803_6488704472565090714_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=SpUeW6SDQakAX-Onqb0&_nc_ht=scontent.fcai19-3.fna&oh=00_AT8C-hXuEj3eQHsS5JubcyQ_XWb-Qh-zX9zLoPCggHkdpw&oe=620FCEFE",
    "Michel Magdy",
    "Description",
  ),
  Item(
    "",
    "Mehrael",
    "Description",
  ),
  Item(
    "https://scontent.fcai19-3.fna.fbcdn.net/v/t39.30808-6/271637246_664512228127419_4393917594952606668_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=JBULRQkxNM4AX-_hOL1&_nc_ht=scontent.fcai19-3.fna&oh=00_AT_pkzx4lJKxVJqjdT7wlqmQG874hDAx2DNmWIiFQtSaJA&oe=6211A9C0",
    "Mina Khalifa",
    "Description",
  ),
  Item(
    "",
    "Mina Girgis",
    "Description",
  ),
  Item(
    "https://www.freepik.com/blog/wp-content/uploads/2016/08/44257-O42PEU.jpg",
    "Mina Lotfy",
    "Description",
  ),
  Item(
    "https://scontent.fcai19-3.fna.fbcdn.net/v/t1.15752-9/273673471_621098442522653_6392285339480366202_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=ae9488&_nc_ohc=bKo95karPOYAX8uDb1b&tn=cLB6RYsT0UBJhgRz&_nc_ht=scontent.fcai19-3.fna&oh=03_AVLlcN0OfGXNRp8y5LydQe4M8S6j0Zm9NgbufRhc7BpLcA&oe=622F8FC3",
    "Sandra Alfy",
    "Description",
  ),
];
