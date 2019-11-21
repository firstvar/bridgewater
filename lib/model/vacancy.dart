enum VACANCY_TYPE{PART_TIME, FULL_TIME, ICO}
class Vacancy{
  String id;
  String city;
  String name;
  VACANCY_TYPE type;
  Map<String, dynamic> description;
  DateTime updatedAt;

  Vacancy.fromJson(Map<String, dynamic> json){
    id = json['id'].toString();
    city = json['city'];
    name = json['name'];
    description = json['description'];
    type = _vacancyTypeFromString(json['type']);
    updatedAt = json['updatedAt'];
  }

  VACANCY_TYPE _vacancyTypeFromString(String type){
    switch(type){
      case "full":
        return VACANCY_TYPE.FULL_TIME;
      case "part":
        return VACANCY_TYPE.PART_TIME;
      case "ico":
        return VACANCY_TYPE.ICO;
      default:
        throw Exception("Unexpected type of vacancy");
    }
  }
}