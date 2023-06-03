class SenModel{
  String uId;
  String dateTime;
  int score;

  SenModel({
    this.uId,
    this.score,
    this.dateTime
  });

  SenModel.fromJson(Map<String, dynamic>json){
    uId =json['uId'];
    score =json['score'];
    dateTime =json['dateTime'];
  }
  Map<String, dynamic>toMap(){
    return{

      'uId': uId,
      'score': score,
      'dateTime': dateTime,
    };
  }

}