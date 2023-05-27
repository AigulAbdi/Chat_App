class ChatModel {
  String? userName;
  String? userId;
  String? senderId;
  String? message;
  DateTime? dateTime;
  ChatModel({
    this.dateTime,
    this.message,
    this.senderId,
    this.userId,
    this.userName,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      userName: json['userName'],
      userId: json['userId'],
      message: json['message'],
      senderId: json['senderId'],
      dateTime: json['dateTime'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'userId': userId,
        'message': message,
        'senderId': senderId,
        'dateTime': DateTime.now(),
      };
}
