import 'package:get/get.dart';

import 'Model/VPNFile.dart';
import 'apis.dart';

class LocationController extends GetxController {
  List<Vpn> vpnlist = [];

  final RxBool isLoading = false.obs;

  Future<void> getVpnData() async {
    isLoading.value = true;
    vpnlist = await APIs.getVpnServer();
    isLoading.value = false;
  }
}
