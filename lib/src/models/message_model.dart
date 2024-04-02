class MessageModel {
  String? id;
  String createdAt;
  String updatedAt;
  String message;
  String send;
  String receive;
  String deletedAt;
  
  
  MessageModel({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.message,
    required this.send,
    required this.receive, 
    required this.deletedAt
  });

  
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map["_id"],
      createdAt: map["createdAt"],
      updatedAt: map["updatedAt"],
      message: map["message"],
      send: map["users"]["send"],
      receive: map["users"]["receive"],
      deletedAt: map["deletedAt"] ?? ''

    );
  }

   Map<String, dynamic> toMap(){
    return {
      "id": id,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "message": message,
      "send": send,
      "receive": receive,
    };
  }
 

}

