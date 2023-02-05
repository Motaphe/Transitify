import 'dart:convert';
import 'package:http/http.dart' as http;

Future main() async {
  var url = Uri.encodeFull(
      'https://api.lyft.com/v1/cost?start_lat=37.7772&start_lng=-122.4233&end_lat=37.7972&end_lng=-122.4533');

  var response = await http.get('OWQQUEhRnR_A');

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);
  } else {
    print('Failed to fetch data');
  }
}
