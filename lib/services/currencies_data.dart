import 'package:flutter/cupertino.dart';

const List<String> fiatCurrenciesList = [
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
  'ZAR',
];

List<String> cryptoCurrenciesList = [
  'BTC',
  'LTC',
  'ETH',
];

class CurrenciesData {
  String getFiatCurrencyForUserLocation({@required double latitude, @required double longitude}) {
    if (latitude == 12.87 && longitude == 121.77) {
      return 'PHP';
    } else if (latitude == 26.06 && longitude == 50.55) {
      return 'BHD';
    } else if (latitude == 4.57 && longitude == 74.29) {
      return 'COP';
    } else if (latitude == 38.96 && longitude == 35.24) {
      return 'TRY';
    } else if (latitude == 14.05 && longitude == 108.27) {
      return 'VND';
    } else {
      return 'AUD';
    }
  }

  void addCustomCryptoCurrencyInTheList(String cryptoCurrency) {
    if (cryptoCurrency == 'Ripple') {
      cryptoCurrenciesList.add('XRP');
    } else if (cryptoCurrency == 'Neo') {
      cryptoCurrenciesList.add('NEO');
    } else if (cryptoCurrency == 'Eos') {
      cryptoCurrenciesList.add('EOS');
    } else if (cryptoCurrency == 'Binance Coin') {
      cryptoCurrenciesList.add('BNB');
    } else if (cryptoCurrency == 'Tezos') {
      cryptoCurrenciesList.add('XTZ');
    }
  }
}
