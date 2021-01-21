import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:triplea_loginpage/constants/EvacuationTableData.dart';

class Services {
  static const ROOT = 'https://10.0.2.2/triplea/conn.php';
  static const _GET_ALL_ACTION = 'GET_ALL';

  static Future<List<EvacuationData>> getDataTable() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Reponse:  ${response.body}');
      if (200 == response.statusCode) {
        List<EvacuationData> list = parseReponse(response.body);
        return list;
      } else {
        return List<EvacuationData>();
      }
    } catch (e) {
      return List<EvacuationData>();
    }
  }

  static List<EvacuationData> parseReponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<EvacuationData>((json) => EvacuationData.fromJson(json))
        .toList();
  }
}
