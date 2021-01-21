class EvacuationData {
  String id;
  String date;
  String duration;
  String main_building;
  String hs_building;
  String st_building;
  String main_canteen;
  String archi_building;
  String total;

  EvacuationData(
      {this.id,
      this.date,
      this.duration,
      this.main_building,
      this.hs_building,
      this.st_building,
      this.main_canteen,
      this.archi_building,
      this.total});

  factory EvacuationData.fromJson(Map<String, dynamic> json) {
    return EvacuationData(
        id: json['id'] as String,
        date: json['date'] as String,
        duration: json['duration'] as String,
        main_building: json['main_building'] as String,
        hs_building: json['hs_building'] as String,
        st_building: json['st_building'] as String,
        main_canteen: json['main_canteen'] as String,
        archi_building: json['archi_building'] as String,
        total: json['total'] as String);
  }
}
