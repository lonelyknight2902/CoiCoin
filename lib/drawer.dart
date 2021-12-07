import 'package:flutter/material.dart';
import './home.dart';
import './account.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text('DevFestChan'),
          accountEmail: const Text('emiudevfest@hcmut.edu.vn'),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade800,
              child: ClipOval(
                child: Image.asset('./assets/doge.jpg'),
              )),
        ),
        ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Coi Your Coin'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Home()));
            }),
        ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Coi Your Card'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Account()));
            }),
      ],
    ));
  }
}
