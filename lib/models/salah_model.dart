class SalahTimeModel {
  late Map<String, dynamic> salahStartTime;
  late Map<String, dynamic> iqamahTime;

  SalahTimeModel({
    this.salahStartTime = const {},
    this.iqamahTime = const {},
  });

  factory SalahTimeModel.fromMap(Map data) {
    return SalahTimeModel(
      salahStartTime: (data.containsKey('salahStartTime') &&
              data['salahStartTime'] is Map<String, dynamic>)
          ? data['salahStartTime']
          : {},
      iqamahTime: (data.containsKey('iqamahTime') &&
              data['iqamahTime'] is Map<String, dynamic>)
          ? data['iqamahTime']
          : {},
    );
  }

  SalahTimeModel fromMap(Map data) {
    return SalahTimeModel.fromMap(data);
  }

  Map<dynamic, dynamic> toJson() =>
      {'salahStartTime': salahStartTime, 'iqamahTime': iqamahTime};
}
