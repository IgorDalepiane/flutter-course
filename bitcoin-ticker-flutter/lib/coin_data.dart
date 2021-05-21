import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const apiKey = '1735DA27-3EEF-4D0A-BABD-B265DB364A89';
const coinApiURL = "rest.coinapi.io";

class CoinData {
  CoinData();

  Future<dynamic> getCoinData(String crypto, String currency) async {
    var url = Uri.https(coinApiURL, "/v1/exchangerate/$crypto/$currency", {"apikey": apiKey});
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.body);
    }
  }
}
