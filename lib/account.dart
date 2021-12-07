import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/coicoin_logo.png', height: 30),
          leading: IconButton(
            icon: Icon(
              Icons.bar_chart,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle_rounded),
              color: Colors.white,
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Column(
            children: [
              Text('\$156.89', style: TextStyle(fontSize: 40)),
              Text(
                'Available Balance',
                style: TextStyle(fontSize: 35),
              ),
              CreditCardWidget(
                cardBgColor: Colors.blueGrey.shade800,
                cardNumber: '4532240806065307',
                expiryDate: '8/2025',
                cardHolderName: 'Testing',
                isHolderNameVisible: true,
                cvvCode: '900',
                obscureCardNumber: true,
                obscureCardCvv: true,
                onCreditCardWidgetChange: (Visa) {},
                showBackView: false,
              ),
            ],
          ),
        ));
  }
}
