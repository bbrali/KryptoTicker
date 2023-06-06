import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../components/krypto_card.dart';
import 'dart:io' show Platform;
import 'custom_currency_screen.dart';
import '../services/location.dart';
import '../services/currencies_data.dart';
import '../services/networking.dart';

const kAPIKey = '24441E03-17A8-4FD7-B4BD-1A027678BDC3';

CurrenciesData currenciesDataHelper = CurrenciesData();

class PricesScreen extends StatefulWidget {
  @override
  _PricesScreenState createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {
  String selectedCurrency = 'AUD';
  List<String> allCryptoCurrencyExchangeRates = ['?', '?', '?', '?'];

  DropdownButton<String> getAndroidDropDown() {
    List<DropdownMenuItem<String>> dropdownMenuItemsList = [];
    for (String currency in fiatCurrenciesList) {
      dropdownMenuItemsList.add(
        DropdownMenuItem(
          child: Text(
            currency,
            style: TextStyle(
              color: Color(0xFF123456),
            ),
          ),
          value: currency,
        ),
      );
    }
    return DropdownButton<String>(
      items: dropdownMenuItemsList,
      onChanged: (itemSelectedValue) {
        setState(() {
          selectedCurrency = itemSelectedValue;
        });
      },
      value: selectedCurrency,
    );
  }

  CupertinoPicker getIOSPicker() {
    List<Text> cupertinoPickerChildrenList = [];
    for (String currency in fiatCurrenciesList) {
      cupertinoPickerChildrenList.add(
        Text(
          currency,
          style: TextStyle(
            color: Color(0xFF123456),
          ),
        ),
      );
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (itemChangedIndexNumber) {
        setState(() {
          selectedCurrency = fiatCurrenciesList[itemChangedIndexNumber];
          allCryptoCurrencyExchangeRates = ['?', '?', '?', '?'];
        });
        getData();
      },
      children: cupertinoPickerChildrenList,
    );
  }

  void getData() async {
    List<String> exchangeRatesList = ['?', '?', '?', '?'];
    int loopCounter = 0;
    for (String cryptoCurrency in cryptoCurrenciesList) {
      print('getData 1111111111');
      Networking networkHelper = Networking('https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$selectedCurrency?apikey=$kAPIKey');
      var data = await networkHelper.getCoinDataFromAPI();
      print('getData 2222222222');
      double rate = data['rate'];
      exchangeRatesList[loopCounter] = (rate.toStringAsFixed(2));
      loopCounter++;
    }

    setState(() {
      allCryptoCurrencyExchangeRates = exchangeRatesList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState 11111');
    getData();
    print('initState 22222');
  }

  @override
  Widget build(BuildContext context) {
    print('Build called !!!!!!!!');
    return Scaffold(
      appBar: AppBar(
        textTheme: TextTheme(
          headline6: kAppBarTitleTextStyle,
        ),
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '💸',
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'KryptoTicker',
              style: TextStyle(
                color: Color(0xFF123456),
                fontSize: 30.0,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: KryptoCard(
                        cardColour: Color(0xFFE9414D),
                        cardShadowColour: Color(0xFFE9414D),
                        coordinatesCircularRadiusTopLeftToBottomRight: <double>[25.0, 25.0, 0.0, 0.0],
                        cardChild: Text(
                          '1 ${cryptoCurrenciesList[0]} = ${allCryptoCurrencyExchangeRates[0]} $selectedCurrency',
                          style: kMainCardTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: KryptoCard(
                        cardColour: Color(0xFFF29F4F),
                        cardShadowColour: Color(0xFFF29F4F),
                        coordinatesCircularRadiusTopLeftToBottomRight: <double>[25.0, 25.0, 0.0, 0.0],
                        cardChild: Text(
                          '1 ${cryptoCurrenciesList[1]} = ${allCryptoCurrencyExchangeRates[1]} $selectedCurrency',
                          style: kMainCardTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: KryptoCard(
                        cardColour: Color(0xFF4AB9FB),
                        cardShadowColour: Color(0xFF4AB9FB),
                        coordinatesCircularRadiusTopLeftToBottomRight: <double>[25.0, 25.0, 25.0, 25.0],
                        cardChild: Text(
                          '1 ${cryptoCurrenciesList[2]} = ${allCryptoCurrencyExchangeRates[2]} $selectedCurrency',
                          style: kMainCardTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () async {
                          String userEnteredCryptoCurrency = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomCurrencyScreen(),
                            ),
                          );
                          if (userEnteredCryptoCurrency != null) {
                            setState(() {
                              print('Entered SetState 111   !!!');
                              currenciesDataHelper.addCustomCryptoCurrencyInTheList(userEnteredCryptoCurrency);
                            });
                            getData();
                            print('A called !!!');
                          }
                        },
                        child: KryptoCard(
                          cardColour: Colors.white,
                          coordinatesCircularRadiusTopLeftToBottomRight: <double>[25.0, 25.0, 25.0, 25.0],
                          cardShadowRadius: 5.0,
                          cardShadowBlurPoints: 15.0,
                          cardChild: cryptoCurrenciesList.length == 3
                              ? Icon(
                                  Icons.add,
                                  color: Color(0xFF123456),
                                  size: 30.0,
                                )
                              : Text(
                                  '1 ${cryptoCurrenciesList[3]} = ${allCryptoCurrencyExchangeRates[3]} $selectedCurrency',
                                  style: kAdditionalCardTextStyle,
                                ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 10.0,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '🙁 Home Currency?',
                      style: TextStyle(
                        color: Color(0xFF123456),
                        fontSize: 22.0,
                        fontStyle: FontStyle.italic,
                        letterSpacing: -2.0,
                        wordSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Location loc = Location();
                        Map<String, double> geoCoordinates = await loc.getGeographicCoordinates();
                        setState(() {
                          print('Entered setState 222 !!!');
                          selectedCurrency = currenciesDataHelper.getFiatCurrencyForUserLocation(latitude: geoCoordinates['latitude'], longitude: geoCoordinates['longitude']);
                          allCryptoCurrencyExchangeRates = ['?', '?', '?', '?'];
                        });
                        getData();
                        print('B called');
                      },
                      child: Icon(
                        Icons.pin_drop,
                        color: Color(0xFF123456),
                        size: 45.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 130.0,
                  child: Platform.isAndroid ? getAndroidDropDown() : getIOSPicker(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
