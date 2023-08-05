// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unnecessary_this

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:staredu/utils/color/color.dart';

class ButtonFull extends StatelessWidget {
  String title;
  Color color;
  Color textColor;
  Color? borderColor;
  Function()? press;

  ButtonFull(
      {required this.title,
      required this.color,
      required this.textColor,
      this.borderColor,
      this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              this.borderColor != null
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: borderColor!),
                    )
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue[200];
              }
              return color;
            },
          ),
        ),
        onPressed: press,
        child: Text(title,
            style: GoogleFonts.poppins(
                fontSize: 16, color: textColor, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
