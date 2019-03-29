import 'package:flutter/material.dart';
import 'API.dart';
import 'drink.dart';

class DetailView extends StatefulWidget {
  final String drinkID;
  final String drinkName;

  DetailView({Key key, @required this.drinkID, @required this.drinkName})
      : super(key: key);

  State createState() => new _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Drink drink;

  @override
  void initState() {
    super.initState();
    loadDrink();
  }

  loadDrink() async {
    print(widget.drinkID);
    var fetchedDrink = await API().fetchDrinkById(widget.drinkID);
    setState(() {
      drink = fetchedDrink;
      print(drink);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: drink == null
          ? Center(child: CircularProgressIndicator())
          : NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        title: Text(drink.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            )),
                        background: Image.network(
                          drink.thumb,
                          fit: BoxFit.cover,
                        )),
                  ),
                ];
              },
              body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Category:"),
                        SizedBox(width: 10),
                        Text(drink.category)
                      ],
                    ),
                    Divider(
                      color: Colors.blue,
                    ),
                    Row(
                      children: <Widget>[Text("Glass:"), Text(drink.glass)],
                    ),
                    Divider(
                      color: Colors.blue,
                    ),
                    Align(
                      child: new Text("Ingredients:"),
                      alignment: FractionalOffset.topLeft,
                    ),
                    Row(
                      children: <Widget>[
                        Text(drink.measure1),
                        SizedBox(width: 10),
                        Text(drink.ingredient1),
                      ],
                    ),
                    Divider(
                      color: Colors.blue,
                    ),
                    Align(
                      child: new Text("Instructions:"),
                      alignment: FractionalOffset.topLeft,
                    ),
                    Text(drink.instructions)
                  ],
                ),
              )),
    );
  }
}
