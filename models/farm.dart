import 'farmer.dart';

class farm {
  List<farmer> farmers;
  farm(this.farmers);

  Map<String, dynamic> toJson() => _farmToJson(this);
}

Map<String, dynamic> _farmToJson(farm f) {
  List<Map<String, dynamic>> farmers = f.farmers != null ?
      f.farmers.map((eachFarmer) => eachFarmer.toJson()).toList() : null;

  return <String, dynamic> {
    'farmers' : farmers
  };
}