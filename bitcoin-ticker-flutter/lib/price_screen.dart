import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinModel = CoinData();
  String selectedCurrency = 'USD';
  Map<String, String> cryptoRates = {};
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    getCryptoValue();
  }

  void getCryptoValue() async {
    isWaiting = true;
    try {
      var coinData = await coinModel.getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        cryptoRates = coinData;
      });
    } catch (e) {
      print(e);
    }
  }

  List<ReusableCurrencyCard> getCryptoWidgets() {
    List<ReusableCurrencyCard> widgetList = [];
    for (var crypto in cryptoList) {
      widgetList.add(
        ReusableCurrencyCard(
          cryptoName: crypto,
          cryptoRate: isWaiting ? '?' : cryptoRates[crypto],
          currencyName: selectedCurrency,
        ),
      );
    }
    return widgetList;
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> widgetList = [];
    for (String currency in currenciesList) {
      widgetList.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: widgetList,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCryptoValue();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItens = [];
    for (String currency in currenciesList) {
      pickerItens.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getCryptoValue();
        });
      },
      children: pickerItens,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getCryptoWidgets(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: iOSPicker(),
          ),
        ],
      ),
    );
  }
}

class ReusableCurrencyCard extends StatelessWidget {
  ReusableCurrencyCard({
    @required this.cryptoRate,
    @required this.cryptoName,
    @required this.currencyName,
  });

  final String cryptoRate;
  final String cryptoName;
  final String currencyName;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $cryptoName = $cryptoRate $currencyName',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
