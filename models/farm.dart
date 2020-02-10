import 'farmer.dart';

class farm {
  List<farmer> farmers;
  farm(this.farmers);

  Map<String, dynamic> toJson() => _farmToJson(this);
  factory farm.fromJson(Map<String, dynamic> json) => _farmFromJson(json);
}

Map<String, dynamic> _farmToJson(farm f) {
  List<Map<String, dynamic>> farmers = f.farmers != null ?
      f.farmers.map((eachFarmer) => eachFarmer.toJson()).toList() : null;

  return <String, dynamic> {
    'farmers' : farmers
  };
}

farm _farmFromJson(Map<String, dynamic> json) {
  var _farmersJson = json['farmers'] as List;
  List<farmer> _farmers = _farmersJson != null ?
                        _farmersJson.map((f) => farmer.fromJson(f)).toList() : null;

  return farm(_farmers);
}