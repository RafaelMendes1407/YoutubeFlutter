import 'package:flutter/material.dart';
import 'package:youtube/screens/Biblioteca.dart';
import 'package:youtube/screens/Inscricao.dart';
import 'API/CustomSearchDelegate.dart';
import 'screens/EmAlta.dart';
import 'screens/Inicio.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  String resultado = "";

  @override
  Widget build(BuildContext context) {

     List<Widget> telas = [
      Inicio(resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/youtube.png",
          width: 98,
          height: 22,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate(),);
              setState(() {
                resultado = res;
              });
            },
          ),

          /*
          IconButton(icon: Icon(Icons.videocam), onPressed: null),
          IconButton(icon: Icon(Icons.account_circle), onPressed: null),
          */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                title: Text("Inicio"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Em Alta"), icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                title: Text("Inscrições"), icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                title: Text("Biblioteca"), icon: Icon(Icons.folder)),
          ]),
    );
  }
}
