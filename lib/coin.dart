class Coin {
  final String name;
  final String symbol;
  final String imageUrl;
  final num price;
  final num change;
  final num changePercentage;

  Coin(this.name, this.symbol, this.imageUrl, this.price, this.change,
      this.changePercentage);
  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        json["name"],
        json["symbol"],
        json["image"],
        json["current_price"],
        json["price_change_24h"],
        json["price_change_percentage_24h"]);
  }
}

List<Coin> coinList = [];
List<Coin> filter = [];
