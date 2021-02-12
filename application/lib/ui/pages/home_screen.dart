import 'package:flutter/material.dart';

import 'package:CovidInfo/api/api_service.dart';
import 'package:CovidInfo/ui/widgets/status_row_card.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

enum CardIcon { Total, Recovered, Active, Critical, Tests, Deceased }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Statistics _statistics = new Statistics();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    Statistics _temp = await requestData();
    setState(() {
      _statistics = _temp;
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    getData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: _onRefresh,
      controller: _refreshController,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: StatusRowCard(
                              iconEnum: CardIcon.Total,
                              statsAmount: _statistics.totalCases,
                              statsLabel: 'Общо случаи',
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: StatusRowCard(
                              iconEnum: CardIcon.Recovered,
                              statsAmount: _statistics.totalRecovered,
                              statsLabel: 'Излекувани',
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: StatusRowCard(
                              iconEnum: CardIcon.Active,
                              statsAmount: _statistics.totalActiveCases,
                              statsLabel: 'Активно болни',
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: StatusRowCard(
                              iconEnum: CardIcon.Critical,
                              statsAmount: _statistics.critical,
                              statsLabel: 'Критични',
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: StatusRowCard(
                              iconEnum: CardIcon.Tests,
                              statsAmount: _statistics.totalTests,
                              statsLabel: 'Tестове',
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: StatusRowCard(
                              iconEnum: CardIcon.Deceased,
                              statsAmount: _statistics.totalDeceased,
                              statsLabel: 'Починали',
                            )),
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
