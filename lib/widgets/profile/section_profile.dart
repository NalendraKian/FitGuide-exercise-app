import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionProfile extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? iconRight;
  final Function()? press;
  const SectionProfile(
      {Key? key,
      required this.title,
      required this.icon,
      this.press,
      this.iconRight = Icons.arrow_forward_ios})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          // border shading
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // icons, edit profile and arrow right
            children: [
              Icon(
                icon,
                color: secondaryColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(title,
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  )),
              const Spacer(),
              Icon(
                iconRight,
                color: blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
