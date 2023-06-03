class SocModel{
  String uId;
  int score;
  String dateTime;

  SocModel({
    this.uId,
    this.score,
    this.dateTime,
  });

  SocModel.fromJson(Map<String, dynamic>json){

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