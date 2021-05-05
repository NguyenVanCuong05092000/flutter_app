import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'class/Product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final product = List<Product>.generate(
      9,
      (index) => Product(
          'img_$index.jpg', "Học Flutter $index", index, "img_$index.jpg", 2));

  onClickTextView(String string) {
    print(string);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              InkWell(
                child: Text("Nguyễn Văn Cường"),
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 5.0),
                                  child: Text("Flutter",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 18,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 5.0),
                                  child: Text(
                                    "Lập trình android",
                                  ),
                                ),
                              ]),
                          Container(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Enter your username"),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.fromLTRB(
                                  2.0, 10.0, 2.0, 10.0),
                              itemCount: product.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: ListBox(
                                    item: Product(
                                        product[index].name,
                                        product[index].description,
                                        product[index].price,
                                        product[index].image,
                                        product[index].rating),
                                  ),
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SecondScreen(item: product[index]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )))
            ])));
  }
}

class ListBox extends StatelessWidget {
  ListBox({Key key, this.item}) : super(key: key);
  final Product item;
  double _size = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Image.asset(
                "assets/images/" + item.image,
                width: 120,
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(item.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  Text(
                    item.description,
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(item.price.toString()),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0),
                        child: IconButton(
                          onPressed: () {
                            print(item.rating);
                          },
                          icon: (item.rating >= 1
                              ? Icon(
                                  Icons.star,
                                  size: _size,
                                )
                              : Icon(
                                  Icons.star_border,
                                  size: _size,
                                )),
                          color: Colors.yellow[600],
                          iconSize: _size,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        child: IconButton(
                          onPressed: () => item.rating = 2,
                          icon: (item.rating >= 2
                              ? Icon(
                                  Icons.star,
                                  size: _size,
                                )
                              : Icon(
                                  Icons.star_border,
                                  size: _size,
                                )),
                          color: Colors.yellow[500],
                          iconSize: _size,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        child: IconButton(
                          onPressed: () => item.rating = 3,
                          icon: (item.rating >= 3
                              ? Icon(
                                  Icons.star,
                                  size: _size,
                                )
                              : Icon(
                                  Icons.star_border,
                                  size: _size,
                                )),
                          color: Colors.yellow[500],
                          iconSize: _size,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({Key key, this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text(item.name),
            ),
            Container(
              child: Image.asset("assets/images/" + item.image),
            ),
            Container(
              child: Text(item.price.toString()),
            ),
            Container(
              child: Text(item.description),
            ),
            Container(
              child: Text(item.rating.toString()),
            )
          ],
        ),
      ),
    );
  }
}
