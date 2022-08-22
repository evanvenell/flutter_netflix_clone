import 'package:flutter/material.dart';
import 'package:netflix_clone/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: NetflixTabBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NetflixTabBar extends StatelessWidget {
  const NetflixTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var test = "Fast Laughs";
    return DefaultTabController(
      length: 5,
      child: Theme(
        data: ThemeData(
          brightness: Brightness.dark,
        ),
        child: Scaffold(
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home",),
              Tab(icon: Icon(Icons.play_arrow), text: "Popular",),
              Tab(icon: Icon(Icons.face), text: "Laughs", ),
              Tab(icon: Icon(Icons.search), text: "Search",),
              Tab(icon: Icon(Icons.download), text: "Downloads",),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff999999),
            indicatorColor: Colors.transparent,
          ),
          body: TabBarView(
            children: [
              HomeView(),
              Center(child: Text("Page 2"),),
              Center(child: Text("Page 3"),),
              Center(child: Text("Page 4"),),
              Center(child: Text("Page 5"),),
            ],
          ),
        ),
      ),
    );
  }
}
