class NarcModel{
  String uId;
  String dateTime;
  int score;


  NarcModel({
     this.uId,
     this.score,
     this.dateTime,
  });

  NarcModel.fromJson(Map<String, dynamic>json){

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