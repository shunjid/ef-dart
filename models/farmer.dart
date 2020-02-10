import 'foodCrops.dart';

class farmer {
  int farmerId;
  String farmerLocation;
  int farmerAge;
  double farmerMonthlyIncome;
  foodCrops crops;

  farmer(this.farmerId, this.farmerLocation, this.farmerAge, this.farmerMonthlyIncome, this.crops);
  factory farmer.fromJson(Map<String, dynamic> json) => _farmerFromJson(json);
  Map<String, dynamic> toJson() => _farmerToJson(this);
}

Map<String, dynamic> _farmerToJson(farmer f) => <String, dynamic> {
    'farmerId' : f.farmerId,
    'farmerLocation' : f.farmerLocation,
    'farmerAge' : f.farmerAge,
    'farmerMonthlyIncome' : f.farmerMonthlyIncome,
    'crops' : f.crops.toJson()
};

farmer _farmerFromJson(Map<String, dynamic> json) {
  return farmer(
      json['farmerId'] as int,
      json['farmerLocation'] as String,
      json['farmerAge'] as int,
      json['farmerMonthlyIncome'] as double,
      foodCrops.fromJson(json['crops']),
  );
}