import 'package:flutter/material.dart';
import 'package:flutter_pizza_list/pizza.dart';
import 'addPizzaDialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pizza Order'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> pizzasInOrder = [];

  _MyHomePageState() {
    //pizzasInOrder[0] = new Pizza("Large", 1);
    //pizzasInOrder.add(new Pizza("Small", 1));
  }

  Future<void> _addPizza() async {
    Pizza newPizza = await showDialog(
        context: context,
        builder: (context) {
          return addPizzaPopup();
        }
    );
    setState(() {
      pizzasInOrder.add(newPizza);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: pizzasInOrder.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              child: ListTile(
                leading: Icon(Icons.restaurant),
                title: Text(pizzasInOrder[position].description),
                onTap: () {
                  print("You tapped on items $position");
                },
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPizza,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}






