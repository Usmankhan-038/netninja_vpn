import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_Controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomePageController());

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 108, 108, 108),
        title: Text("Net Ninja"),
        actions: [
          _controller.vpn.value!.countryShort.isEmpty
              ? IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/locationScreen');
                  },
                  icon: Icon(Icons.public))
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/locationScreen');
                  },
                  child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                          'assets/Flags/${_controller.vpn.value!.countryShort.toLowerCase()}.png')),
                ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[800],
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              child: Center(
                child: Image.asset("assets/images/NetNinja.png"),
              ),
            ),
            Container(
              height: 100,
              width: 300,
              child: Center(
                child: Text(
                  "Welcome to Net Ninja",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Obx(
              () {
                return GestureDetector(
                  onTap: () {
                    _controller.connectToVpn();
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: _controller.isconnecting.value
                          ? Colors.green
                          : Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        _controller.isconnecting.value
                            ? "Wait Connecting"
                            : "Connected",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
