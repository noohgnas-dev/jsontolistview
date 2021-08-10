import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jsontolistview/sms_services.dart';

SmsServices parseSmsService(String resBody) {
  final responseData = json.decode(resBody);
  final SmsServices s = SmsServices.fromJson(responseData);

  print(s.toJson());
  return s;
}

Future<SmsServices> fetchSmsService() async {
  print("2 fetchSmsService");
  final res =
      await http.get(Uri.parse('http://200.200.0.29/api.php?GetServiceStates'));
  if (res.statusCode == 200) {
    return parseSmsService(res.body);
  } else {
    throw Exception('Request API error');
  }
}
