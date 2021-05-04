import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final imgAvatar = ["img_1.jpg","img_2.jpg","img_3.jpg","img_4.jpg","img_5.jpg","img_6.jpg","img_7.jpg","img_8.jpg","img_9.jpg"];
  final tvTitle = ["img_1.jpg","img_2.jpg","img_3.jpg","img_4.jpg","img_5.jpg","img_6.jpg","img_7.jpg","img_8.jpg","img_9.jpg"];
  final price = [1,2,3,4,5,6,7,8,9];
  final description = ["Học Flutter 1","Học Flutter 2","Học Flutter 3","Học Flutter 4","Học Flutter 5","Học Flutter 6","Học Flutter 7","Học Flutter 8","Học Flutter 9"];
  onClickTextView(String string){
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
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen())),
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
                                    "Ngôn ngữ lập trình android",
                                  ),
                                ),
                              ]),
                          Container(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                  labelText: "Enter your username"
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.fromLTRB(
                                  2.0, 10.0, 2.0, 10.0),
                              itemCount: imgAvatar.length,
                              itemBuilder: (context, index){
                                return InkWell(
                                  child: ListBox(
                                    name: tvTitle[index],
                                    description: description[index],
                                    price: price[index],
                                    image: imgAvatar[index],
                                  ),
                                  onTap: () => onClickTextView(tvTitle[index])
                                      // Scaffold.of(context)
                                      // .showSnackBar(SnackBar(content: Text(index.toString()))),
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
  ListBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

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
                "assets/images/" + image,
                width: 120,
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(this.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  Text(
                    this.description,
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(this.price.toString())
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text("data"),
            ),
            Container(
              child: Image.asset("assets/images/img_1.jpg"),
            ),Container(
              child: Text("1"),
            ), Container(
              child: Text("Học Flutter 1"),
            )
          ],
        ),
      ),
    );
  }
}


