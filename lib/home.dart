import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'coin_card.dart';
import './coin.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
      }
      print(coinList.first.name);
      setState(() {
        coinList;
      });

      return coinList;
    } else {
      throw Exception("Failed to load");
    }
  }

  @override
  void initState() {
    fetchCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          title: const Text('CoiCoin'),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: coinList.length,
          itemBuilder: (context, index) {
            return CoinCard(
                coinList[index].name,
                coinList[index].symbol,
                coinList[index].imageUrl,
                coinList[index].price.toDouble(),
                coinList[index].change.toDouble(),
                coinList[index].changePercentage.toDouble());
          },
        ));
  }
}
