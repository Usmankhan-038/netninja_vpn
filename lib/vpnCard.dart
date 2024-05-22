import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Model/VPNFile.dart';
import 'home_Controller.dart';

class VpnCard extends StatelessWidget {
  final Vpn vpn;
  const VpnCard({super.key, required this.vpn});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<HomePageController>();
    String _formatBytes(int bytes, int decimals) {
      if (bytes <= 0) return "0 B";
      const suffixes = ['Bps', "Kbps", "Mbps", "Gbps", "Tbps"];
      var i = (log(bytes) / log(1024)).floor();
      return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
    }

    return InkWell(
      onTap: () {
        _controller.vpn.value = vpn;
        Navigator.pushNamed(context, '/homePage');
      },
      child: Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.015,
            right: MediaQuery.of(context).size.width * 0.015),
        child: Card(
            shadowColor: const Color.fromARGB(255, 225, 223, 223),
            color: Colors.grey[500],
            elevation: 10,
            child: ListTile(
              leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                      'assets/Flags/${vpn.countryShort.toLowerCase()}.png')),
              title: Text(vpn.countryLong),
              subtitle: Row(children: [
                Icon(Icons.speed),
                SizedBox(
                  width: 4,
                ),
                Text(_formatBytes(vpn.speed, 1))
              ]),
              trailing: Icon(Icons.arrow_forward_ios),
            )),
      ),
    );
  }
}
