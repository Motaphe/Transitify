import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchRoute() async {
  var url = Uri.https('api.uber.com', '/v1.2/estimates/price',
      {'start_latitude': '33.9480', 'start_longitude': '83.3773', 'end_latitude': '33.7531', 'end_longitude': '84.3853'});
  final response = await http.get(url,
      headers: {'Authorization': 'Token RN5NuQxNDDJPp-yBP4iP0PulJ4fEfi5q5i8JgMl_'});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
  } else {
    print('Failed to fetch route: ${response.statusCode}');
    print(response.body);
  }
}

void main() {
  fetchRoute();
}
