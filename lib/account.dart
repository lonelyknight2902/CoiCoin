import 'package:credit_card_slider/card_background.dart';
import 'package:credit_card_slider/card_company.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/validity.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_slider/credit_card_slider.dart';
import './drawer.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFD6D6D6), Color(0xFFEEEEEE), Color(0xFF212121)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 750.0, 1000.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/coicoin_logo.png', height: 30),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 0.0),
          child: Column(
            children: <Widget>[
              Text('\$156.89',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient)),
              Text(
                'Available Balance',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
              SizedBox(height: 50),
              Transform.scale(
                scale: 1.2,
                child: CreditCard(
                  cardBackground:
                      ImageCardBackground(AssetImage('assets/card_bg.png')),
                  cardNetworkType: CardNetworkType.visa,
                  cardHolderName: 'DevFest HCMC',
                  cardNumber: '4716085933146241',
                  company: CardCompany.americanExpress,
                  validity: Validity(validThruMonth: 8, validThruYear: 2025),
                ),
              ),
            ],
          ),
        ));
  }
}
