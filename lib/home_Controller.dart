import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netninja_vpn/Vpn_Engine.dart';

import 'Model/VPNFile.dart';
import 'Model/vpnConfig.dart';

class HomePageController extends GetxController {
  final RxBool isconnecting = false.obs;
  final Rx<Vpn?> vpn = Vpn.fromJson({}).obs;

  get vpnState => null;

  void connectToVpn() {
    isconnecting.value = true;
    if (vpn.value!.openVPNConfigDataBase64.isEmpty) return;

    if (vpn.value!.openVPNConfigDataBase64.isNotEmpty) {
      final data = Base64Decoder().convert(vpn.value!.openVPNConfigDataBase64);
      final config = Utf8Decoder().convert(data);

      final vpnConfigFile = VpnConfig(
          country: vpn.value!.countryLong,
          config: config,
          username: 'vpn',
          password: 'vpn');
      VpnEngine.startVpn(vpnConfigFile);
      log(vpn.value!.openVPNConfigDataBase64);
      log(config);
      isconnecting.value = false;
    }
  }

  Color get getButtonColor {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return Colors.blue;

      case VpnEngine.vpnConnected:
        return Colors.green;

      default:
        return Colors.orangeAccent;
    }
  }

  // vpn button text
  String get getButtonText {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return 'Tap to Connect';

      case VpnEngine.vpnConnected:
        return 'Disconnect';

      default:
        return 'Connecting...';
    }
  }
}
