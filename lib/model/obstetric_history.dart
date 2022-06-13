class ObstetricHistory {
  int gravida;
  int id;
  String lnmp;
  int parity;
  String edd;
  int abortion;
  int livingChildren;
  int gaInWeeks;
  String pastMedicalSurgicalHistory;

  ObstetricHistory(
      {required this.id,
      required this.gravida,
      required this.lnmp,
      required this.parity,
      required this.abortion,
      required this.edd,
      required this.livingChildren,
      required this.gaInWeeks,
      required this.pastMedicalSurgicalHistory});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'gravida': gravida,
      'lnmp': lnmp,
      'parity': parity,
      'abortion':abortion,
      'edd': edd,
      'living_children': livingChildren,
      'ga_in_weeks': gaInWeeks,
      'past_medical_surgical_history': pastMedicalSurgicalHistory
    };

    return map;
  }

  factory ObstetricHistory.fromMap(Map<String, dynamic> data) {
    return ObstetricHistory(
        id: data["id"],
        gravida: data["gravida"],
        abortion:data["abortion"],
        lnmp: data["lnmp"],
        parity: data["parity"],
        edd: data["edd"],
        livingChildren: data["living_children"],
        gaInWeeks: data["ga_in_weeks"],
        pastMedicalSurgicalHistory: data["past_medical_surgical_history"]);
  }
}
