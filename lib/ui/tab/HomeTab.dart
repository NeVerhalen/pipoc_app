import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipoc_app/ui/homePage.dart';



class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     // new Home(); nao presta essa bosta
     ThemeData(primaryColor: Colors.red);

      return Stack(
        children: <Widget>[
          Home(),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.red,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text("Pipoc"),
                  centerTitle: true,
                ),
              )
            ],
          ),
        ],
      );

  }
}//Inicia o Grid dando a cor base

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
} //a classe

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 2, vsync: this);

    var tabBarItem = new TabBar(
      tabs: [
        new Tab(
          icon: new Icon(Icons.favorite_border),
        ),
        new Tab(
          icon: new Icon(Icons.new_releases),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.red,
    ); //Onde está o coração e o ponto de exclamação em cima



    var gridView1 = new GridView.builder(
        itemCount: 20,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                alignment: Alignment.center,
                child: new Text('Item $index'),
              ),
            ),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("GridView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ),
              );
            },
          );
        }); //Primeiro Grid, de favoritos

    var gridView2 = new GridView.builder(
        itemCount: 20,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                alignment: Alignment.center,
                child: new Text('Item $index'),
              ),
            ),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("GridView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ),
              );
            },
          );
        }); //segundo Grid de lançamentos

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("PIPOC"),
          bottom: tabBarItem,
        ),
        //Aqui provavelmente é onde vc deverá mudar, já que é aquela barra de cima

        body: new TabBarView(
          controller: tabController,
          children: [
            /*listItem,*/
            gridView1,
            gridView2,
          ],
        ), //Corpinho onde chama os Grids
      ),
    );

  }
}
