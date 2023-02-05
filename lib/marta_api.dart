import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getTrainSchedule() async {
  final response = await http.get(Uri.parse(
      'https://developerservices.itsmarta.com:18096/railrealtimearrivals?apiKey=f9c9ef1c-b477-4e38-901d-cb0fd81b908b'));

  if (response.statusCode == 200) {
    // If the call to the API was successful, parse the JSON
    Map<String, dynamic> schedule = json.decode(response.body);
    return schedule;
  } else {
    // If the call was not successful, throw an error
    throw Exception('Failed to retrieve train schedule');
  }
}

void main() async {
  Map<String, dynamic> schedule = await getTrainSchedule();
  print(schedule);
}

// This should be the key to it!
void checkAlignment(List<Map<String, dynamic>> rides, String destination) {
  for (var ride in rides) {
    if (ride['DESTINATION'] == destination) {
      print('Match found! Details of the ride:');
      print('DESTINATION: ${ride['DESTINATION']}');
      print('DIRECTION: ${ride['DIRECTION']}');
      print('EVENT_TIME: ${ride['EVENT_TIME']}');
      print('HEAD_SIGN: ${ride['HEAD_SIGN']}');
      print('LINE: ${ride['LINE']}');
      print('WAITING_TIME: ${ride['WAITING_TIME']}');
      break;
    }
  }
}
