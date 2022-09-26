import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                const Text(
                  "00:00:00",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 80,
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
                         shape: const  StadiumBorder( 
                          side: BorderSide(color: Colors.tealAccent)
                         ),
                          child: const Text(
                            'Start',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {}),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        fillColor: Colors.greenAccent,
                         shape:const  StadiumBorder( 
                          side: BorderSide(color: Colors.tealAccent)
                         ),
                          onPressed: () {},
                          child: const Text('Stop',style: TextStyle(color: Colors.white)),
                    )
                )],
                ),
                RawMaterialButton(
                  fillColor: Colors.greenAccent,
                         shape:const  StadiumBorder( 
                          side: BorderSide(color: Colors.tealAccent)
                         ),
                    onPressed: () {},
                    child: const Text('Reset',style: TextStyle(color: Colors.white)),
            )],
            ),
          ),
        ));
  }
}
