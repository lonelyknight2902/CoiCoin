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
          accountName: Text('DevFestChan'),
          accountEmail: Text('emiudevfest@hcmut.edu.vn'),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade800,
              child: ClipOval(
                child: Image.network(
                  'https://coin68.com/wp-content/uploads/2021/10/DOGE-Thug-Life.jpg',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              )),
        ),
        ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Trang Coin'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Account()));
            }),
        ListTile(
            leading: Icon(Icons.money),
            title: Text('Trang Main'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Home()));
            }),
      ],
    ));
  }
}
