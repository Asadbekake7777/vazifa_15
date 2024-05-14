import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vazifa_15/pages/pages.dart';
import 'package:vazifa_15/widgets/widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _board = [];
  String _curentPlayer = "X";
  String win = "";

  int x = 0;
  int o = 0;

  @override
  void initState() {
    _board = List.filled(9, "");
    super.initState();
  }

  void _switchplayer() {
    _curentPlayer = _curentPlayer == "X" ? "0" : "X";
  }

  void _checkWinner() {
    var lst = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var lis in lst) {
      var a = _board[lis[0]];
      var b = _board[lis[1]];
      var d = _board[lis[2]];

      if (a == b && b == d && a != "") {
        win = a;
        break;
      }
    }

    if (win == "" && _board.contains("")) {
      win = "";
    }
  }

  void _playMove(int index) {
    if (_board[index] == "" && win == "") {
      setState(
        () {
          _board[index] = _curentPlayer;
          _switchplayer();
          _checkWinner();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 115, 143, 107),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Texttitel(title: win == "" ? "${_curentPlayer}" : "Winner: $win"),
          const Column(
            children: [
              Text(
                ".....................................",
                style: TextStyle(color: Colors.amber, fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 140,
              ),
              Text(
                "${x}",
                style: const TextStyle(color: Colors.white, fontSize: 35),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                ":",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${o}",
                style: const TextStyle(color: Colors.white, fontSize: 35),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 325,
            height: 325,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 115, 143, 107),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 115, 143, 107), blurRadius: 10),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                children: List.generate(
                  9,
                  (index) => GestureDetector(
                    onTap: () => _playMove(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amberAccent, width: 1),
                      ),
                      child: _board[index] != ""
                          ? Center(
                              child: Text(
                                _board[index] == "0" ? "0" : "X",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25,),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => StartTicTacToe()), (route) => false);
            },
            child: ZoomTapAnimation(
              child: Container(
                height: 40,
                width: 320,
                decoration: const BoxDecoration(color: Color.fromARGB(255, 21, 212, 146),),
                child: const Center(
                  child: Text("NEW GAME", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, ),),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              _board = List.filled(9, "");
              setState((){});
            },
            child: ZoomTapAnimation(
              child: Container(
                height: 40,
                width: 320,
                decoration: const BoxDecoration(color: Color.fromARGB(255, 21, 212, 146),),
                child: const Center(
                  child: Text("RESET GAME", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, ),),
                ),
              ),
            ),
          ),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chevron_left_rounded,
              size: 25,
              color: Colors.black87,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chevron_right_rounded,
              size: 25,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.black87,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.four_k_rounded,
              size: 25,
              color: Colors.black87,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Text(
              "...",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
