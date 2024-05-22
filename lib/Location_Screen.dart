import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:netninja_vpn/vpnCard.dart';
import 'Location_Controller.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _controller = LocationController();
  void initState() {
    super.initState();
    _controller.getVpnData();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 108, 108, 108),
          title: Center(
            child: _controller.isLoading.value
                ? Text("Loading Location")
                : Text('VPN Location ${_controller.vpnlist.length}'),
          ),
        ),
        body: InkWell(
          onTap: () {
            print("click");
          },
          child: Container(
            color: Colors.grey[800],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () {
                if (_controller.isLoading.value) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08),
                      height: 220,
                      width: 220,
                      child: Column(
                        children: [
                          Lottie.asset(
                              'assets/animation/animation_llo3bp51.json'),
                          Text(
                            "Loading...",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (_controller.vpnlist.isEmpty) {
                  return Center(
                    child: Text("No Data Found"),
                  );
                } else {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _controller.vpnlist.length,
                    itemBuilder: (context, index) {
                      return VpnCard(vpn: _controller.vpnlist[index]);
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
