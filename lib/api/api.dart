import 'package:flutter/material.dart';
import 'package:gst_app/models/GSTModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GSTProvider with ChangeNotifier {
  GSTModel _result;
  GSTModel get result => _result;
  void fetchGstInfo(gstin_id) async {
    final url = Uri.parse(
        'https://masters-gst.herokuapp.com/gstinfo/$gstin_id?format=json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _result = GSTModel.fromJson(data);
      notifyListeners();
    }else{
      _result = null;
      notifyListeners();
    }
  }
}
