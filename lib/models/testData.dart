class TestData {
  double lat = 0.0;
  double lon = 0.0;
  DateTime testTime = DateTime.now();
  DateTime uploadTime = DateTime.now();
  double nitrogen = 0.0, phosphorous = 0.0, potassium = 0.0;
  int deviceID = 0;

  TestData.newTest({
    required this.lat,
    required this.lon,
    required this.testTime,
    required this.uploadTime,
    required this.nitrogen,
    required this.phosphorous,
    required this.potassium,
    required this.deviceID,
  });

  fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    testTime = DateTime.parse(
        json['testTime'].toDate().toString()); //json['testTime'];
    uploadTime = DateTime.parse(json['uploadTime'].toDate().toString());
    //uploadTime = json['uploadTime'];
    nitrogen = json['nitrogen'];
    phosphorous = json['phosphorous'];
    potassium = json['potassium'];
    deviceID = json['deviceID'];
  }

  TestData.init() {}

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
      'testTime': testTime,
      'uploadTime': uploadTime,
      'nitrogen': nitrogen,
      'phosphorous': phosphorous,
      'potassium': potassium,
      'deviceID': deviceID,
    };
  }
}
