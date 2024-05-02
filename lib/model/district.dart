class District {
  final int createdAt;
  final int code;
  final DistrictData district;
  final int stateId;
  final int countryId;
  final int updatedAt;
  final int id;

  District({
    required this.createdAt,
    required this.code,
    required this.district,
    required this.stateId,
    required this.countryId,
    required this.updatedAt,
    required this.id,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      createdAt: json['createdAt'],
      code: json['code'],
      district: DistrictData.fromJson(json['district']),
      stateId: json['stateId'],
      countryId: json['countryId'],
      updatedAt: json['updatedAt'],
      id: json['id'],
    );
  }
}

class DistrictData {
  final String en;
  final String ta;

  DistrictData({
    required this.en,
    required this.ta,
  });

  factory DistrictData.fromJson(Map<String, dynamic> json) {
    return DistrictData(
      en: json['en'],
      ta: json['ta'],
    );
  }
}
