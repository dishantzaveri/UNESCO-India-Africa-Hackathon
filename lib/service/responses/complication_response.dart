import 'package:partograph/model/complication.dart'; 

class ComplicationResponse {
  Complication? complication;

  ComplicationResponse.fromJson(Map<String, dynamic> json) {
    if (json['complication'] != null) {
      complication = Complication.fromMap(json['complication']);
    }
  }
}
