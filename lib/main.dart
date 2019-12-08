import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  final List<Tab> tabs = <Tab>[
    Tab(text: 'One'),
    Tab(text: "Two"),
    Tab(text: "Three"),
    Tab(text: "Four")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("TabBar & TabView Study", style: TextStyle(
          color: Colors.black,
        ),),
        bottom: TabBar(
//          isScrollable: true,
          tabs: tabs,
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 18.0,
          vertical: 8),
          labelColor: Colors.black,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((tab) {
          return _createTab(tab);
        }).toList(),)
    );
  }

  Widget _createTab(Tab tab){

    const data = [
      "hoge", "huga", "fizz", "buzz", "hoge", "huga", "fizz", "buzz", "hoge", "huga", "fizz", "buzz", "hoge", "huga", "fizz", "buzz", "hoge", "huga", "fizz", "buzz"
    ];

    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(data[index], 
                style: TextStyle(fontSize: 24.0))
              )
          );
        }
      );
  }
}
