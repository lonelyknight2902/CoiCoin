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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('./assets/dogecoin.jpg'),
                      fit: BoxFit.cover)
              ),
              accountName: const Text(
                  'DevFestChan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              accountEmail: const Text(
                  'emiudevfest@hcmut.edu.vn',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
              ),
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
                      context, MaterialPageRoute(builder: (_) => const Home()));
                }),
            ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Coi Your Card'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const Account()));
                }),
          ],
    ));
  }
}
