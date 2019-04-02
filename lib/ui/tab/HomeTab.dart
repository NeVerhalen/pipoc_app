import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipoc_app/ui/homePage.dart';
import 'package:pipoc_app/ui/principal_filme.dart';
import'package:cloud_firestore/cloud_firestore.dart';


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
      itemCount: 4,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 20.0),
      itemBuilder: (BuildContext context, int index) {
        final imageName = index <4 ?
        "images/images/Img${index + 1}.jpg" : "images/images/Img${index + 1}.jpg";
        return GestureDetector(
          child: Image.asset(
          imageName,
          width: 100.0,
          height: 40.0,
          fit: BoxFit.contain,

          ),

          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => Principal())
            );

          },
        );

      },
    ); //Primeiro Grid, de favoritos

    var gridView2 = GridView.builder(
      itemCount: 5,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 20.0),
      itemBuilder: (BuildContext context, int index) {
        final imageName2 = index < 5 ?
        "images/images/Fut${index + 1}.jpg" : "images/images/Fut${index + 1}.jpg";
        return GestureDetector(
          child: Image.asset(
            imageName2,
            width: 10.0,
            height: 20.0,
            fit: BoxFit.contain,
          ),

          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Principal())
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
        backgroundColor: Colors.red,
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
