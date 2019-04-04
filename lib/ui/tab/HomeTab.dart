import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipoc_app/ui/homePage.dart';
import 'package:pipoc_app/ui/principal_filme.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:pipoc_app/ui/principal_filme.dart';
import 'package:pipoc_app/ui/tiles/principal_tile.dart';


class HomeTab extends StatelessWidget {
  final DocumentSnapshot snapshot;
  HomeTab(this.snapshot);

  @override
  Widget build(BuildContext context) {

    ThemeData(primaryColor: Colors.red);

    return Stack(
      children: <Widget>[
        Home(this.snapshot),
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
  final DocumentSnapshot snapshot;
  Home(this.snapshot);

  @override
  _HomeState createState() => _HomeState(this.snapshot);
} //a classe

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController tabController;
  final DocumentSnapshot snapshot;
  _HomeState(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('PIPOC'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.red,
          ),
        ),
        body: FutureBuilder <QuerySnapshot>(
            future: Firestore.instance.collection("Filmes").document(snapshot.documentID)
            .collection("Aquaman").getDocuments(),
            builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else
            return TabBarView(children: [
              GridView.builder(
                padding: EdgeInsets.all(4.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    childAspectRatio: 0.20,
                  ),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (
                  context, index
                  ){
                  return PrincipalTile("grid", Principal.fromDocument(snapshot.data.documents[index]));
                  }
              ),
              Container(color: Colors.red,)]
            );
        },
        ),
      ),

    );

    //Onde está o coração e o ponto de exclamação em cima

  }
}
