import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/widgets/rain.dart';
import 'dart:math' as math;
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/widgets/time.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    final Key parallaxOne = GlobalKey();

    bool showdate = true;
    
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Погода', 
          style: TextStyle(color: Color.fromARGB(255, 59, 114, 215)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 59, 114, 215),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              elevation: 0,
              barrierColor: Colors.black.withAlpha(1),
              backgroundColor: Colors.transparent,
              builder: (builder) {
                return Container(
                  height: 600.0,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: res_height * 0.04,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/clock.png',
                                  width: 25,
                                ),
                                SizedBox(
                                  width: res_width * 0.04,
                                ),
                                Text(
                                  "Прогноз на сегодня",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: res_height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 59, 114, 215).withOpacity(0.1),
                                      radius: 25,
                                      child: Image.asset(
                                        'assets/images/rainy.png',
                                        width: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Дождь",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color(0xffff5580).withOpacity(0.1),
                                      radius: 25,
                                      child: Image.asset(
                                        'assets/images/wind.png',
                                        width: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Вететр\n1 м/с",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: res_height * 0.04,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TimeWidget(
                                          data: data[index],
                                          active: index == 1,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(color: Colors.grey)
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      )),
                );
              }).whenComplete(() {
          });
        },
        child: Container(
          //add ClipRRect widget for Round Corner
          color: Color.fromARGB(255, 59, 121, 215),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 13, right: 13, top: 13, bottom: 26),
                child: ListTile(
                  leading: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: Image.asset('assets/images/clock.png')),
                  title: Text(
                    "Прогноз на сегодня",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: Image.asset('assets/images/calendar.png')),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: res_height * 1,
        color: Color.fromARGB(255, 59, 119, 215),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              height: showdate ? res_height * 0.15 : res_height * 0.125,
              width: double.infinity,
            ),
            Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                height: res_height * 1,
                child: ParallaxRain(
                  key: parallaxOne,
                  dropColors: 
                  [
                    Colors.white,
                  ],
                  trail: true,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: res_height * 0.175,
              child: Image.asset(
                'assets/images/girl.png',
                height: res_height * 0.5,
              ),
            ),
            Positioned(
              left: 20,
              top: res_height * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'СР, 17 МАЯ',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),Text(
                    '14°',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.cloudy_snowing,
                    color: Colors.white,
                    size: 40,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: res_height * 0.02,
              left: 20,
              child: Text(
                'Майкоп',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var data = [
  {'time': '09:00', 'temp': '12°'},
  {'time': '10:00', 'temp': '14°'},
  {'time': '11:00', 'temp': '17°'},
  {'time': '12:00', 'temp': '19°'},
  {'time': '13:00', 'temp': '22°'},
  {'time': '14:00', 'temp': '22°'},
  {'time': '15:00', 'temp': '21°'},
  {'time': '16:00', 'temp': '20°'},
  {'time': '17:00', 'temp': '20°'},
  {'time': '18:00', 'temp': '18°'},
];