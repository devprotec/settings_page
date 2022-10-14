// ignore_for_file: public_member_api_docs, sort_constructors_first
class Chat {
  String senderName;
  String messagePreview;
  String date;
  String senderImageLocation;
  int numberOfUnreadMessages;

  Chat({
    required this.senderName,
    required this.messagePreview,
    required this.date,
    required this.senderImageLocation,
    required this.numberOfUnreadMessages,
  });
}

class Conversation {
  String message;
  String messageType;
  String date;

  Conversation({
    required this.message,
    required this.messageType,
    required this.date,
  });

  factory Conversation.fromMap(Map<String, dynamic> map) {
    return Conversation(
      message: map['message'],
      messageType: map['messageType'],
      date: map['date'],
    );
  }
}
