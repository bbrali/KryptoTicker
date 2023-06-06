import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final String url;

  Networking(this.url);

  dynamic getCoinDataFromAPI() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Sorry! Coudn\'t get Exchange Rates. ${response.statusCode}');
    }
  }
}
