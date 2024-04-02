
class ShedulingModels {
  String id;
  String title;
  String descrition;
  DateTime date;
  ShedulingModels({
    required this.id,
    required this.title,
    required this.descrition,
    required this.date,

  });

  factory ShedulingModels.fromMap(Map<String, dynamic> map){
    return ShedulingModels(
      id: map["_id"],
      title: map["title"], 
      descrition: map["descrition"], 
      date: map["date"],);
  }

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "title": title,
      "descrition": descrition,
      "date": date,
    };
  }
}
