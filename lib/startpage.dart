import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/homepage.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

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
            child: Container(
              child: Center(
                child: Text("TIC TAC TOE", style: newFontWhiteBig,),
              ),
            )
          ),
          Expanded(
              child: Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(70),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          color: Colors.white,
                          child: Center(
                            child: Text("PLAY GAME", style: newFontBlack,),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ),
          Expanded(
              child: Container(
                child: Center(
                  child: Text("@made by AndyChiang", style: newFontWhite,),
                ),
              )
          ),
        ],
      ),
    );
  }
}
