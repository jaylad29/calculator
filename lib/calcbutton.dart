import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int fillcolor;
  final int textcolor;
  final double textsize;
  final Function callBack;
  const CalcButton(
      {Key key,
      this.fillcolor,
      this.textsize = 28,
      this.text,
      this.callBack,
      this.textcolor = 0xFFFFFFFF})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text,
            style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: textsize)),
          ),
          onPressed: () {
            callBack(text);
          },
          color: fillcolor != null ? Color(fillcolor) : null,
          textColor: Color(textcolor),
        ),
      ),
    );
  }
}
