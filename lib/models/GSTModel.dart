import 'package:flutter/foundation.dart';

class GSTModel {
  final String gstin;
  final String name;
  final String addrs_line_1;
  final String addrs_line_2;
  final String addrs_line_3;
  final String pincode;
  final String registration_date;
  final String cancellation_date;
  final String state_jurisdiction;
  final String center_jurisdiction;
  final String status_type;
  final String taxpayer_type;
  final String bussiness_type;

  GSTModel(
      {this.gstin,
      this.name,
      this.addrs_line_1,
      this.addrs_line_2,
      this.addrs_line_3,
      this.pincode,
      this.registration_date,
      this.cancellation_date,
      this.state_jurisdiction,
      this.center_jurisdiction,
      this.status_type,
      this.taxpayer_type,
      this.bussiness_type});

  factory GSTModel.fromJson(Map<String, dynamic> json) {
    return GSTModel(
      gstin: json["gstin_id"],
      name: json["name"],
      addrs_line_1: json["addrs_line_1"],
      addrs_line_2: json["addrs_line_2"],
      addrs_line_3: json["addrs_line_3"],
      pincode: json["pincode"],
      registration_date: json["registration_date"],
      cancellation_date: json["cancellation_date"],
      state_jurisdiction: json["state_jurisdiction"],
      center_jurisdiction: json["center_jurisdiction"],
      status_type: json["status_type"],
      taxpayer_type: json["taxpayer_type"],
      bussiness_type: json["bussiness_type"],
    );
  }
}
