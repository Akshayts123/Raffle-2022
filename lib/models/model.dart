
import 'dart:convert';

List<popularapi> popularapiFromJson(String str) =>
    List<popularapi>.from(json.decode(str).map((x) => popularapi.fromJson(x)));

String popularapiToJson(List<popularapi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class popularapi {
  String? city;
  String? country;
  String? patientId;
  int? yearOfBirth;
  String? gender;
  List<Diagnosis>? diagnosis;

  popularapi(
      {this.city,
        this.country,
        this.patientId,
        this.yearOfBirth,
        this.gender,
        this.diagnosis});

  popularapi.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    patientId = json['patient_id'];
    yearOfBirth = json['year_of_birth'];
    gender = json['gender'];
    if (json['diagnosis'] != null) {
      diagnosis = <Diagnosis>[];
      json['diagnosis'].forEach((v) {
        diagnosis!.add(new Diagnosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    data['patient_id'] = this.patientId;
    data['year_of_birth'] = this.yearOfBirth;
    data['gender'] = this.gender;
    if (this.diagnosis != null) {
      data['diagnosis'] = this.diagnosis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Diagnosis {
  String? diagId;
  String? code;
  String? diagDate;
  String? description;
  String? patientId;

  Diagnosis(
      {this.diagId,
        this.code,
        this.diagDate,
        this.description,
        this.patientId});

  Diagnosis.fromJson(Map<String, dynamic> json) {
    diagId = json['diag_id'];
    code = json['code'];
    diagDate = json['diag_date'];
    description = json['description'];
    patientId = json['patient_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diag_id'] = this.diagId;
    data['code'] = this.code;
    data['diag_date'] = this.diagDate;
    data['description'] = this.description;
    data['patient_id'] = this.patientId;
    return data;
  }
}