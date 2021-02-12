import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:CovidInfo/ui/util/app_colors.dart';

class SquareContainer extends StatefulWidget {
  final String header;
  final String animationPath;

  const SquareContainer({
    Key key,
    @required this.header,
    @required this.animationPath,
  }) : super(key: key);

  @override
  _SquareContainerState createState() => _SquareContainerState();
}

class _SquareContainerState extends State<SquareContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .20,
        width: MediaQuery.of(context).size.width * .38,
        decoration: _squareContainerDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Table(
            children: <TableRow>[
              TableRow(children: [
                TableCell(
                    child: Text(widget.header,
                        style: _secondaryStyle, textAlign: TextAlign.center))
              ]),
              TableRow(children: [
                TableCell(
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: Center(
                      child: Lottie.network(widget.animationPath,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _squareContainerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [
        BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
      ],
    );
  }

  TextStyle get _secondaryStyle => GoogleFonts.openSans(
      color: AppColors.colorDarkBlue,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.20,
      fontSize: 12);
}
