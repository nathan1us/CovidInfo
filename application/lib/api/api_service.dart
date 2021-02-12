import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart';

final String apiURL = 'https://corona.lmao.ninja/v2/countries/bulgaria';

class Statistics {
  final int totalCases;
  final int totalRecovered;
  final int totalDeceased;
  final int totalActiveCases;
  final int totalTests;
  final int critical;

  Statistics(
      {this.totalCases,
      this.totalRecovered,
      this.totalDeceased,
      this.totalActiveCases,
      this.totalTests,
      this.critical});
}

Future<Statistics> requestData() async {
  Statistics statistics;

  try {
    Response response = await get(apiURL);
    Map responseDecoded = jsonDecode(response.body);
    statistics = new Statistics(
        totalCases: responseDecoded["cases"],
        totalRecovered: responseDecoded["recovered"],
        totalDeceased: responseDecoded["deaths"],
        totalActiveCases: responseDecoded["active"],
        totalTests: responseDecoded["tests"],
        critical: responseDecoded["critical"]);
    print(responseDecoded);
  } catch (e) {
    print("--------------");
    print("Error when trying to retrieve data from the external server.");
    print(e);
    print("--------------");
  }

  return statistics;
}
