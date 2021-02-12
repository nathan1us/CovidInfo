import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:CovidInfo/ui/util/app_colors.dart';
import 'package:CovidInfo/ui/util/app_animations.dart';
import 'package:CovidInfo/ui/widgets/square_container.dart';

class VirusScreen extends StatefulWidget {
  @override
  _VirusScreenState createState() => _VirusScreenState();
}

class _VirusScreenState extends State<VirusScreen> {
  double _opacity = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
        child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: _opacity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _header('Симптоми'),
                  SquareContainer(
                      header: 'Висока температура',
                      animationPath: AppAnimations.highTemp),
                  SquareContainer(
                      header: 'Кихане', animationPath: AppAnimations.sneezing),
                  SquareContainer(
                      header: 'Хронични инфекции',
                      animationPath: AppAnimations.cold),
                ],
              ),
              Column(
                children: <Widget>[
                  _header('Предпазване'),
                  SquareContainer(
                      header: 'Мий ръцете си често!',
                      animationPath: AppAnimations.handsWashing),
                  SquareContainer(
                      header: 'Използвай дезинфектант редовно!',
                      animationPath: AppAnimations.disinfection),
                  SquareContainer(
                      header: 'Спазвай дистанция от поне 2 метра!',
                      animationPath: AppAnimations.distance),
                  SquareContainer(
                      header: 'Винаги носи маска или друго предпазно средство!',
                      animationPath: AppAnimations.maskWearing),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(String header) => Text(header, style: _headerStyle);

  TextStyle get _headerStyle => GoogleFonts.openSans(
      color: AppColors.colorDarkRed,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.68,
      fontSize: 18);
}
