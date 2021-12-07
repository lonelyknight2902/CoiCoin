import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  //const Coin({ Key? key }) : super(key: key);
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
  final double change;
  final double changePercentage;

  CoinCard(this.name, this.symbol, this.imageUrl, this.price, this.change,
      this.changePercentage);
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 0.0),
            child: AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(imageUrl, width: 50),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(symbol,
                                style: TextStyle(
                                  fontSize: 10,
                                )),
                          ]),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 1.0, 16.0, 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 0.1),
                Row(children: <Widget>[
                  Text(
                    '\$$change',
                    style: TextStyle(
                      color: change > 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  change > 0
                      ? const Icon(
                          Icons.arrow_drop_up_rounded,
                          color: Colors.green,
                          size: 30,
                        )
                      : const Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                ]),
                //const SizedBox(height: 1.0),
                Text(
                  '$changePercentage%',
                  style: TextStyle(
                    fontSize: 8,
                    color: change > 0
                        ? Colors.green.withOpacity(0.5)
                        : Colors.red.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
