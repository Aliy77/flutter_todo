import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/weather.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, 
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Мой день'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                CircleAvatar(backgroundImage: AssetImage('assets/animoji_avatar.png'), radius: 30,),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Icon(Icons.person, size: 25, color: Colors.white),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text('Tiffany Donovan', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ]
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Row( 
                  children: [
                    Icon(Icons.mail_outline, size: 25, color: Colors.white),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text('tiffany.donovan@null', style: TextStyle(color:Colors.white, fontSize: 15)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                ElevatedButton(
                  onPressed: () {
                    //Navigator.pushReplacementNamed(context, '/todo');
                    Navigator.pushNamed(context, '/todo');
                  }, 
                  child: Text('Задачи'),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.black45)),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Navigator.pushReplacementNamed(context, '/weather');
                    Navigator.pushNamed(context, '/weather');
                  }, 
                  child: Text('Погода'),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.black45)),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}