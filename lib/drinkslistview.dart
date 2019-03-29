import 'package:flutter/material.dart';

import 'API.dart';
import 'detailview.dart';
import 'drink.dart';

class DrinksListView extends StatefulWidget {
  State createState() => new _DrinksListViewState();
}

class _DrinksListViewState extends State<DrinksListView> {

  Iterable<Drink> _drink = new Iterable.empty();

  @override
  void initState() {
    super.initState();
    loadDrink();
  }

  loadDrink() async {
    var drink = await API().fetchDrinkList();
    setState(() {
      _drink = drink;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Alcoholic Cocktails')),
        body: _drink.length == 0
            ? Center(child: CircularProgressIndicator())
            : Column(children: <Widget>[
          Expanded(child: buildListView(context, _drink))
        ]));
  }
}

ListView buildListView(BuildContext context, Iterable<Drink> drink) {
  return ListView(
      children: ListTile.divideTiles(
          context: context,
          tiles: drink.map((drink) {
            return createTile(drink, context);
          })).toList());
}

ListTile createTile(Drink drink, BuildContext context) {
  return ListTile(
    leading: Image.network(
      drink.thumb,
      width: 50,
    ),
    title: Text(drink.name),
    onTap: () {
      showDrinkDetails(context, drink.id, drink.name);
    },
    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0)
  );
}

showDrinkDetails(BuildContext context, String drinkID, String drinkName) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailView(drinkID: drinkID, drinkName: drinkName,)),
  );
}
