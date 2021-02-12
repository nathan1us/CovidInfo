import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: false,
      onRefresh: _onRefresh,
      controller: _refreshController,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('PARTNERS AND INFO'),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
