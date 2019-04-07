import 'package:flutter/material.dart';
import 'package:pipoc_app/models/user_model.dart';
import 'package:pipoc_app/ui/tiles/DrawerTile.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            Colors.red,
            Colors.white,
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        )
    );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0,top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0,8.0 ),
                height: 110.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top:10.0,
                      bottom: 0.0,
                      child: Text("Pipoc",
                        style: TextStyle(fontSize: 34.0,fontWeight: FontWeight.w400),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)
                              )
                            ],
                          );
                        },
                      )
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.favorite_border, "Favoritos",pageController,0),
              DrawerTile(Icons.new_releases, "Novidades",pageController,1),
              DrawerTile(Icons.near_me, "GPS",pageController,2),
              DrawerTile(Icons.block, "Logout",pageController,3),
            ],
          )
        ],
      ),
    );
  }
}
