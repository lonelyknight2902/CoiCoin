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
  bool isSearching = false;
  final _controller = TextEditingController();

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    filter = [];
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
            filter.add(Coin.fromJson(map));
          }
        }
      }
      setState(() {
        coinList;
        filter;
      });

      return coinList;
    } else {
      throw Exception("Failed to load");
    }
  }

  void _filterList(String value) {
    setState(() {
      filter = coinList
          .where(
              (coin) => coin.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(const Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? Image.asset(
                  'assets/coicoin_logo.png',
                  height: 30,
                )
              : TextField(
                  controller: _controller,
                  onChanged: (value) {
                    _filterList(value);
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.0),
                    ),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Coin Here",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                          isSearching = false;
                          filter = coinList;
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
          actions: !isSearching
              ? [
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                  ),
                  const IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                ]
              : [],
          backgroundColor: Colors.blueGrey[800],
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: filter.length,
          itemBuilder: (context, index) {
            return CoinCard(
                filter[index].name,
                filter[index].symbol,
                filter[index].imageUrl,
                filter[index].price.toDouble(),
                filter[index].change.toDouble(),
                filter[index].changePercentage.toDouble());
          },
        ));
  }
}
