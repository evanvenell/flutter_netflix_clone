import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {

  TextStyle topMenuStyle = new TextStyle(fontFamily: 'Avenir next', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600);
  TextStyle buttonInfoStyle = new TextStyle(fontFamily: 'Avenir next', fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600);
  //TextStyle buttonBlackStyle = new TextStyle(fontFamily: 'Avenir next', fontSize: 10, color: Colors.black, fontWeight: FontWeight.w600);

  //const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
        //color: Colors.red,
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 550,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("lib/assets/starwars.jpg"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            child: Image(
                              image: AssetImage("lib/assets/netflix.png"),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Series',
                              style: topMenuStyle,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Films',
                              style: topMenuStyle,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'My List',
                              style: topMenuStyle,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.add, color: Colors.white, size: 30,),
                          Text("My List", style: buttonInfoStyle,),
                        ],
                      ),
                      onPressed: () {

                      },
                    ),

                    FlatButton(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.play_arrow, color: Colors.black,),
                          Text("Play", style: TextStyle(color: Colors.black,))
                        ],
                      ),
                      onPressed: () {

                      },
                    ),

                    FlatButton(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.info, color: Colors.white, size: 30,),
                          Text("Info", style: buttonInfoStyle,),
                        ],
                      ),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ),//Center?
              makePopularWidget("Popular on Netflix"),
              makePopularWidget("Trending Now"),
              makeContinueWatchingWidget("Continue Watching for Evan"),
              bannerMovieWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bannerMovieWidget() {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text("Available Now", style: topMenuStyle,),
          ),
          Container(
            child: Image(
              image: new AssetImage("lib/assets/birdbox.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.play_arrow, color: Colors.black,),
                        Text("Play", style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ),
                  onPressed: () {

                  },
                ),

                FlatButton(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.white,),
                        Text("My List", style: TextStyle(color: Colors.white,),),
                      ],
                    ),
                  ),
                  onPressed: () {

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget makePopularWidget(String title) {
    return new Container(
      height: 220,
      padding: EdgeInsets.only(left: 5, right: 5,),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: topMenuStyle,
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              padding: EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,
              children: makeContainers(),
            ),
          )
        ],
      ),
    );
  }

  Widget makeContinueWatchingWidget(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(title, style: topMenuStyle,),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              padding: EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,
              children: makeContinueContainers(),
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;
  List<Widget> makeContainers() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(new Container(
        padding: EdgeInsets.all(5),
        height: 200,
        child: Image(
          image: AssetImage("lib/assets/" + counter.toString() + ".jpg"),
        ),
      ));
      
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }

  List<Widget> makeContinueContainers() {
    List<Container> movieList = [];
    for (int i = 1; i < 7; i++) {
      counter++;
      movieList.add(new Container(
        padding: EdgeInsets.all(2),
        height: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 149,
              width: 100,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("lib/assets/" + counter.toString() + ".jpg"),
                  fit: BoxFit.fitHeight,
                )
              ),
              child: Center(
                child: FlatButton(
                  child: Icon(Icons.play_circle_outline, size: 70),
                  onPressed: () {

                  },
                ),
              ),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.only(left: 10, right: 10),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 25),
                    child: Text(
                      "S1:E" + i.toString(),
                      style: TextStyle(color: Color(0xFFc1c1c1)),
                    ),
                  ),
                  Icon(
                    Icons.info,
                    size: 15,
                    color: Color(0xFFc1c1c1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
      
      if (counter == 12) {
        counter = 1;
      }
    }
    return movieList;
  }
}