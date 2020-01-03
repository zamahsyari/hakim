import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://mastersgalleryfoods.com/wp-content/uploads/2018/10/P_Header-Images_Home-Page-Tacos-1.jpg',
  'https://www.thecandidadiet.com/wp-content/uploads/2018/08/sugary-snacks-1200x628.jpg',
  'https://mastersgalleryfoods.com/wp-content/uploads/2018/10/P_Header-Images_Home-Page-Tacos-1.jpg',
  'https://assets.nhs.uk/prod/images/A_1117_processed-foods_E0HWJ7.2e16d0ba.fill-640x229.jpg',
  'https://asset.kompas.com/crops/pvHZPuSw1hJ6b290QZjCMEQXQG4=/0x5:1750x1171/750x500/data/photo/2017/02/28/3675196636.jpg',
  'https://canadify.com/wp-content/uploads/2018/02/KFC-Canada-Brings-Back-Extra-Crispy-Chicken-For-A-Limited-Time-678x381.jpg'
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Material(
            color: Colors.orange,
            elevation: 5.0,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                    suffixIcon: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    border: InputBorder.none,
                    hintText: "Search Foods")),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: CarouselSlider(
            items: child,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 3.1,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            imgList,
            (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            },
          ),
        ),
        Container(
          child: Card(
            child: Image.asset(
              'assets/images/kopi.jpeg',
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        ),
        Container(
          child: Card(
            child: Image.asset(
              'assets/images/kopi.jpeg',
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        ),
        Container(
          child: Card(
            child: Image.asset(
              'assets/images/kopi.jpeg',
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        ),
      ],
    );
  }
}
