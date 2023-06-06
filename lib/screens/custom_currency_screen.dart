import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CustomCurrencyScreen extends StatefulWidget {
  @override
  _CustomCurrencyScreenState createState() => _CustomCurrencyScreenState();
}

class _CustomCurrencyScreenState extends State<CustomCurrencyScreen> {
  String userEnteredCryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF123456),
                  size: 50.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0, bottom: 20.0),
              child: TextField(
                onChanged: (cryptoCurrencyEntered) {
                  userEnteredCryptoCurrency = cryptoCurrencyEntered;
                },
                decoration: kInputFieldDecoration,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, userEnteredCryptoCurrency);
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFF123456),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  'Get Prices',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
