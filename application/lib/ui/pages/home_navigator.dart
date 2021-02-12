import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:CovidInfo/ui/widgets/app_bar.dart';
import 'package:CovidInfo/ui/util/app_colors.dart';

import 'home_screen.dart';
import 'virus_screen.dart';
import 'about_screen.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _index = 1;
  List<Widget> _pages = [VirusScreen(), HomeScreen(), AboutScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLight,
      appBar: ApplicationBar(),
      body: _pages[_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
          child: BottomNavigationBar(
            onTap: (int val) {
              if (val == _index) return;
              setState(() {
                _index = val;
              });
            },
            currentIndex: _index,
            unselectedLabelStyle:
                GoogleFonts.openSans(fontWeight: _labelFontStyle),
            unselectedIconTheme: IconThemeData(color: AppColors.colorBlue),
            selectedIconTheme: IconThemeData(color: AppColors.colorDarkBlue),
            selectedLabelStyle:
                GoogleFonts.openSans(fontWeight: _labelFontStyle),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.virus),
                  title: Text('Симптоми', style: _labelStyle)),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.chartBar),
                  title: Text('Статистика', style: _labelStyle)),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.handshake),
                  title: Text('Партньори', style: _labelStyle)),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get _labelStyle => TextStyle(color: AppColors.colorDarkBlue);

  FontWeight get _labelFontStyle => FontWeight.bold;
}
