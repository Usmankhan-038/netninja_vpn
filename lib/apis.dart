import 'dart:convert';
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:http/http.dart';

import 'Model/VPNFile.dart';

class APIs {
  static Future<List<Vpn>> getVpnServer() async {
    final List<Vpn> vpnList =
        []; // Corrected variable name: vpnList instead of VpnList
    final response = await get(Uri.parse('http://www.vpngate.net/api/iphone/'));
    print(response.body);
    final csvString = response.body.split("#")[1].replaceAll('*', '');

    List<List<dynamic>> listOfValues =
        const CsvToListConverter().convert(csvString);

    final header = listOfValues[0];

    for (var i = 1; i < listOfValues.length - 1; i++) {
      // Loop through rows (except header)
      Map<String, dynamic> tempJson = {};
      if (listOfValues[i].isNotEmpty) {
        for (var j = 0; j < header.length; j++) {
          tempJson[header[j].toString()] =
              listOfValues[i][j]; // Use header[j] as key
        }

        log(jsonEncode(tempJson));
        vpnList.add(Vpn.fromJson(tempJson));
      }
    }

    log(vpnList.first.hostName);
    vpnList.shuffle();
    return vpnList;
  }
}
