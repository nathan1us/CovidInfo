import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:CovidInfo/ui/util/app_colors.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RichText(
      text: TextSpan(
        style: GoogleFonts.rubik(
            color: AppColors.colorDarkBlue,
            fontSize: 26,
            fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(text: 'Covid'),
          TextSpan(
              text: 'Info',
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: AppColors.colorBlue))
        ],
      ),
    ));
  }
}
