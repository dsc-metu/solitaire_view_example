import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color1 = Colors.white;
  Color color2 = Colors.blue;
  Color color3 = Colors.red;
  Color color4 = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: Text(
              "Solitaire",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white70,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Stack(
              children: [
                solitaireCard(60, 60, Colors.white),
                solitaireCard(60, 180, Colors.white),
                solitaireCard(60, 230, Colors.white),
                solitaireCard(60, 280, Colors.white),
                solitaireCard(60, 330, Colors.white),
                for (double left = 75; left < 375; left = left + 50)
                  solitaireCard(160, left, color1),
                for (double left = 125; left < 375; left = left + 50)
                  solitaireCard(175, left, color2),
                for (double left = 175; left < 375; left = left + 50)
                  solitaireCard(190, left, color3),
                for (double left = 225; left < 375; left = left + 50)
                  solitaireCard(205, left, color4),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                Color colorX = color1;
                color1 = color2;
                color2 = color3;
                color3 = color4;
                color4 = colorX;
              });
            },
            child: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}

Widget solitaireCard(double top, double left, Color color) {
  return Positioned(
    top: top,
    left: left,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      width: 35,
      height: 50,
    ),
  );
}
