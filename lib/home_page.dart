import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00";
  String digitMinutes = "00";
  String digitHours = "00";
  bool isStarted = false;
  late Timer? timer;
  List laps = [];

//pause/stop function
  void pause() {
    timer!.cancel();
    setState(() {
      isStarted = false;
    });
  }
//reset functions
  void reset() {
    timer!.cancel();
    setState(() {
     digitSeconds = "00";
   digitMinutes = "00";
  digitHours = "00";
    });
  }
  //function to start or create timer

  void start() {
    isStarted = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds! + 1;
      int? localMinutes = minutes;
      late int localHours = hours!;
      if (localSeconds > 59) {
        if (localMinutes! > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitHours = (hours! >= 10) ? "$hours" : "0$hours ";
        digitMinutes = (minutes! >= 10) ? "$minutes" : "0$minutes ";
        digitSeconds = (seconds! >= 10) ? "$seconds" : "0$seconds";
      });
    });
  }
  //functions to add laps in the container
  void addLaps(){
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: Text(
                  "TikiTimer App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  "$digitHours:$digitMinutes:$digitSeconds",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 400,
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(8)),
                      
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: RawMaterialButton(
                          fillColor: Colors.greenAccent,
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.tealAccent)),
                          child: Text(
                            !isStarted ? 'Start' : 'Pause',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            !isStarted ? start() : pause();
                          }),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: RawMaterialButton(
                      fillColor: Colors.greenAccent,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Colors.tealAccent)),
                      onPressed: () {
                        reset();
                      },
                      child: const Text('Reset',
                          style: TextStyle(color: Colors.white)),
                    ))
                  ],
                ),
                RawMaterialButton(
                  fillColor: Colors.greenAccent,
                  shape: const StadiumBorder(
                      side: BorderSide(color: Colors.tealAccent)),
                  onPressed: () {},
                  child: const Text('Add Laps',
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
}
