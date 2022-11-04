import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  Future<bool> sendTicket(String qrtext) async {
    var client = http.Client();
    final url = Uri.parse('http://10.10.25.23:8000/api/scan-ticket/');
    final headers = {"Content-type": "application/json"};

    final json = {
      "decoded_string": qrtext,
    };

    final response = await http.post(url, headers: {}, body: json);

    if (response.statusCode == 200) {
      print("Successful bro");
      print(response.body);

      final scannedResponse = scannedResponseFromJson(response.body);
      print("scannedResponse:");
      print(scannedResponse.isSuccess);
      return scannedResponse.isSuccess;
    }
    return false;
  }
}

ScannedResponse scannedResponseFromJson(String str) =>
    ScannedResponse.fromJson(json.decode(str));

String scannedResponseToJson(ScannedResponse data) =>
    json.encode(data.toJson());

class ScannedResponse {
  ScannedResponse({
    required this.isSuccess,
  });

  bool isSuccess;

  factory ScannedResponse.fromJson(Map<String, dynamic> json) =>
      ScannedResponse(
        isSuccess: json["is_success"],
      );

  Map<String, dynamic> toJson() => {
        "is_success": isSuccess,
      };
}
