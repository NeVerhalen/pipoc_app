import 'package:flutter/material.dart';
import 'package:pipoc_app/ui/principal_filme.dart';

class PrincipalTile extends StatelessWidget{

  final String type;
  final Principal movie;

  PrincipalTile(this.type, this.movie);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Card(
        child: type == "grid" ?
            Column (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AspectRatio(aspectRatio: 0.4,
                child: Image.network(
                  movie.image[0],
                  fit: BoxFit.cover,

                ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        Text(movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
            :Row()
      ),
    );
  }
}