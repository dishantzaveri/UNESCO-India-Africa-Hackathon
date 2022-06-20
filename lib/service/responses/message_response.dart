class MessageResponse {
  String message = "";

  MessageResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = json['message'];
    }
  }
}
