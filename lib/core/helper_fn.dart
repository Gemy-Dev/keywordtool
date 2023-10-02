import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:keyword_planner/core/errors/error.dart';

// this function take url and quryparms and header and return json code;
Future<dynamic> helperFn(String url,
    {required String unencodedPath,
    Map<String, dynamic>? query,
    Map<String, String>? headers}) async {
  final uri = Uri.https(url, unencodedPath, query);
  final response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    

    dynamic jsonData;
    try {
      jsonData = jsonDecode(response.body);
    } catch (e) {
      return response.body;
    }

    return jsonData;
  } else {
    print('errorrrrrrrrrrr');
    throw StatusCodeException(response.statusCode.toString());
  }
}
