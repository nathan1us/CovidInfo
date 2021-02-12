import 'package:flutter/material.dart';

import 'package:CovidInfo/ui/pages/home_screen.dart';
import 'package:CovidInfo/ui/widgets/status_row.dart';

class StatusRowCard extends StatefulWidget {
  final CardIcon iconEnum;
  final int statsAmount;
  final String statsLabel;

  const StatusRowCard(
      {Key key,
      @required this.iconEnum,
      @required this.statsAmount,
      @required this.statsLabel})
      : super(key: key);

  @override
  _StatusRowCardState createState() => _StatusRowCardState();
}

class _StatusRowCardState extends State<StatusRowCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: StatusRow(
                iconIndex: widget.iconEnum.index,
                statusNumber: widget.statsAmount,
                statusText: widget.statsLabel,
              ),
            )
          ],
        ),
      ),
    );
  }
}
