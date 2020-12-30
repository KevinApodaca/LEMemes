import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: GradientAppBar(
          leading: Container(
            margin: EdgeInsets.only(left: 20),
            child: Icon(Icons.more_vert),
          ),
          title: Text("Caroline.app"),
          gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Caroline Salas",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "A curated list of legendary pictures from the legendary student"),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Begin the search",
                      border: InputBorder.none,
                      fillColor: Colors.grey,
                      icon: Icon(Icons.search)),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            SliverStaggeredGrid.countBuilder(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset("img/$index.jpg"),
                    ),
                  );
                },
                itemCount: 60)
          ],
        ),
      ),
    );
  }
}
