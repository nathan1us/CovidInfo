import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:CovidInfo/ui/util/app_colors.dart';

List<FaIcon> icons = [
  FaIcon(FontAwesomeIcons.chartBar, size: 20, color: AppColors.colorDarkBlue),
  FaIcon(FontAwesomeIcons.virusSlash, size: 20, color: AppColors.colorGreen),
  FaIcon(FontAwesomeIcons.virus, size: 20, color: AppColors.colorDarkBlue),
  FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorOrange),
  FaIcon(FontAwesomeIcons.vials, size: 20, color: AppColors.colorDarkBlue),
  FaIcon(FontAwesomeIcons.skullCrossbones,
      size: 20, color: AppColors.colorDarkRed)
];

class StatusRow extends StatelessWidget {
  final int iconIndex;
  final String statusText;
  final int statusNumber;

  const StatusRow({
    Key key,
    @required this.iconIndex,
    @required this.statusText,
    @required this.statusNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icons[iconIndex],
            Text(statusNumber.toString(),
                style: GoogleFonts.openSans(
                    color: icons[iconIndex].color,
                    fontWeight: FontWeight.w800,
                    fontSize: 17)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(statusText,
              style: GoogleFonts.openSans(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w800,
                  fontSize: 24)),
        )
      ],
    );
  }
}
