import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isO = true;  // 第一次是O
  int count = 0;
  List<String> displayXO = ["","","","","","","","",""];

  var scoreStyle = TextStyle(color: Colors.white, fontSize: 25);
  // ignore: non_constant_identifier_names
  int OScore = 0;
  // ignore: non_constant_identifier_names
  int XScore = 0;

  static var newFontBlack = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.black87, letterSpacing: 3));
  static var newFontWhite = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
  static var newFontWhiteBig = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 30));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player O", style: newFontWhite,),
                        SizedBox(height: 15,),
                        Text(OScore.toString(), style: newFontWhite,)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player X", style: newFontWhite,),
                        SizedBox(height: 15,),
                        Text(XScore.toString(), style: newFontWhite,)
                      ],
                    )
                  ],
                ),
              )
          ),
          Expanded(
            flex: 6,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _tapped(index),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[700], width: 2)
                    ),
                    child: Center(
                      child: Text(
                        displayXO[index],
                        style: newFontWhiteBig,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Text("@made by AndyChiang", style: newFontWhite,),
              ),
            ),),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (isO && displayXO[index]=="") {
        displayXO[index] = "O";
        _checkWinner();
        isO = !isO;
      }
      else if(!isO && displayXO[index]=="") {
        displayXO[index] = "X";
        _checkWinner();
        isO = !isO;
      }
    });
  }

  void _checkWinner() {
    count += 1;
    if (displayXO[0]==displayXO[1] && displayXO[0]==displayXO[2] && displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
    else if (displayXO[3]==displayXO[4] && displayXO[3]==displayXO[5] && displayXO[3] != "") {
      _showWinDialog(displayXO[3]);
    }
    else if (displayXO[6]==displayXO[7] && displayXO[6]==displayXO[8] && displayXO[6] != "") {
      _showWinDialog(displayXO[6]);
    }
    else if (displayXO[0]==displayXO[3] && displayXO[0]==displayXO[6] && displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
    else if (displayXO[1]==displayXO[4] && displayXO[1]==displayXO[7] && displayXO[1] != "") {
      _showWinDialog(displayXO[1]);
    }
    else if (displayXO[2]==displayXO[5] && displayXO[2]==displayXO[8] && displayXO[2] != "") {
      _showWinDialog(displayXO[2]);
    }
    else if (displayXO[0]==displayXO[4] && displayXO[0]==displayXO[8] && displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
    else if (displayXO[2]==displayXO[4] && displayXO[2]==displayXO[6] && displayXO[2] != "") {
      _showWinDialog(displayXO[2]);
    }
    else {
      if (count == 9) {
        _showWinDialog("tie");
      }
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: winner != "tie" ? Text("Winner is $winner") : Text("Tie!"),
            actions: [
              FlatButton(
                  onPressed: () {
                    _cleanBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text("Play again")
              ),
            ],
          );
        }
    );

    if (winner == "O") {
      OScore += 1;
    }
    else if (winner == "X") {
      XScore += 1;
    }
  }

  void _cleanBoard() {
    setState(() {
      for(int i=0; i<displayXO.length; i++) {
        displayXO[i] = "";
      }
      count = 0;
    });
  }
}