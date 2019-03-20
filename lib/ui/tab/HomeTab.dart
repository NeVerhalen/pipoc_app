import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipoc_app/ui/homePage.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Home(); nao presta essa bosta
    ThemeData(primaryColor: Colors.red);

    return Stack(
      children: <Widget>[
        Home(),
        // Essa CustomScrollView está roubando
        // todos os eventos de tab que acontecem.
        CustomScrollView(
          // shrinkWrap: true vai fazer funcionar pois
          // a view agora ocupa só espaço necessário para
          // a SliverAppBar, porém eu recomendo não usar a
          // CustomScrollView ou reestruturar ela para
          // que o o grid fique do campo slivers.
          shrinkWrap: true,
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
} //Inicia o Grid dando a cor base

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
} //a classe

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this);

    var tabBarItem = TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.favorite_border),
        ),
        Tab(
          icon: Icon(Icons.new_releases),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.red,
    ); //Onde está o coração e o ponto de exclamação em cima

    var gridView1 = GridView.builder(
      itemCount: 20,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            elevation: 5.0,
            child: Container(
              alignment: Alignment.center,
              child: Text('Item $index'),
            ),
          ),
          onTap: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              child: CupertinoAlertDialog(
                title: Column(
                  children: <Widget>[
                    Text("GridView"),
                    Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                  ],
                ),
                content: Text("Selected Item $index"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  )
                ],
              ),
            );
          },
        );
      },
    ); //Primeiro Grid, de favoritos

    var gridView2 = GridView.builder(
      itemCount: 20,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            elevation: 5.0,
            child: Container(
              alignment: Alignment.center,
              child: Text('Item $index'),
            ),
          ),
          onTap: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              child: CupertinoAlertDialog(
                title: Column(
                  children: <Widget>[
                    Text("GridView"),
                    Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                  ],
                ),
                content: Text("Selected Item $index"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  )
                ],
              ),
            );
          },
        );
      },
    ); //segundo Grid de lançamentos

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("PIPOC"),
          bottom: tabBarItem,
        ),
        //Aqui provavelmente é onde vc deverá mudar, já que é aquela barra de cima

        body: TabBarView(
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
