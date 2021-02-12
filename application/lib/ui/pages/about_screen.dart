import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:CovidInfo/ui/util/app_colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _header(
                      'Световна Здравна Организация\nМинистерство на Здравеопазването'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/WHO_logo.png',
                    fit: BoxFit.fitWidth,
                    height: 300,
                    width: 210,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/MH_logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(String header) => Text(
        header,
        style: _headerStyle,
        textAlign: TextAlign.center,
      );

  TextStyle get _headerStyle => GoogleFonts.openSans(
      color: AppColors.colorDarkRed,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.68,
      fontSize: 16);
}
