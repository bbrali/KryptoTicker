import 'package:flutter/material.dart';

const TextStyle kAppBarTitleTextStyle = TextStyle(
  color: Color(0xFF123456),
  fontSize: 30.0,
);

const TextStyle kMainCardTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
);

const TextStyle kAdditionalCardTextStyle = TextStyle(
  color: Color(0xFF123456),
  fontSize: 25.0,
);

const InputDecoration kInputFieldDecoration = InputDecoration(
  icon: Icon(
    Icons.monetization_on,
    size: 30.0,
    color: Color(0xFF123456),
  ),
  hintText: 'Enter Crypto Currency',
  hintStyle: TextStyle(
    fontStyle: FontStyle.italic,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);
