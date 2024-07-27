import 'dart:convert';

import 'package:flutter_animation/model/user_model.dart';
import 'package:http/http.dart';

class ApiService {
  String endPoint = "https://reqres.in/api";

  Future<List<Data>> getUser() async {
    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => Data.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
