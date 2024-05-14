import 'package:flutter/material.dart';
import 'package:vazifa_15/pages/homepage.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StartTicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 115, 143, 107),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 250,),
          const Row(
            children: [
              SizedBox(width: 80,),
              Text("Tic Tak Toe", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
            ],
          ),
          const SizedBox(height: 200,),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => HomePage(),),
                    (route) => false);
              },
              child: ZoomTapAnimation(
                child: Container(
                  height: 70,
                  width: 220,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 21, 212, 146),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Center(
                    child: Text(
                      "START",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
