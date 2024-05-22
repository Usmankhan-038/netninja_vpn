import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[800],
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Net Ninja",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.public,
                color: Colors.white,
              ),
              title: Text(
                "Public IP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // Code to handle when "Public IP" is tapped
              },
            ),
            ListTile(
              leading: Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              title: Text(
                "Connect to VPN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // Code to handle when "Connect to VPN" is tapped
              },
            ),
            ListTile(
              leading: Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              title: Text(
                "Disconnect from VPN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // Code to handle when "Disconnect from VPN" is tapped
              },
            ),
          ],
        ),
      ),
    );
  }
}
