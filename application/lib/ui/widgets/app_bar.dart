import 'package:flutter/material.dart';

import 'app_logo.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(110.0), // here the desired height
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0), child: AppLogo()),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0);
}
