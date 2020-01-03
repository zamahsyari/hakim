import 'package:probation/page/home.dart' as homepage;
import 'package:probation/page/myorder.dart' as orderpage;
import 'package:probation/page/profile.dart' as profilepage;
import 'package:probation/page/loginPage.dart' as loginPage;
import 'package:flutter/material.dart';

void main() => runApp(Myprob());

class Myprob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This widget is the root of your application.
    return MaterialApp(
      title: 'Probation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Probation'),
      routes: <String, WidgetBuilder>{
        // Set routes for using the Navigator.
        '/profile': (BuildContext context) => new profilepage.Profile(),
        '/loginPage': (BuildContext context) => new loginPage.Login()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  void _checkPage(int req) {
    switch (req) {
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => loginPage.Login()),
        );
        break;
      default:
        setState(() {
          _selectedPage = req;
        });
        break;
    }
  }

  int _selectedPage = 0;
  final _pageOptions = [
    new homepage.Home(),
    new orderpage.Myorder(),
    new profilepage.Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is cal
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "A-food",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _pageOptions[_selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.blueGrey[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("myorder"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("profile"),
          ),
        ],
        onTap: (index) {
          _checkPage(index);
        },
      ),
    );
  }
}
