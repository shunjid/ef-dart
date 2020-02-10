import 'foodCrops.dart';

class farmer {
  int farmerId;
  String farmerLocation;
  int farmerAge;
  double farmerMonthlyIncome;
  foodCrops crops;

  farmer(this.farmerId, this.farmerLocation, this.farmerAge, this.farmerMonthlyIncome, this.crops);
  Map<String, dynamic> toJson() => _farmerToJson(this);
}

Map<String, dynamic> _farmerToJson(farmer f) => <String, dynamic> {
    'farmerId' : f.farmerId,
    'farmerLocation' : f.farmerLocation,
    'farmerAge' : f.farmerAge,
    'farmerMonthlyIncome' : f.farmerMonthlyIncome,
    'crops' : f.crops.toJson()
};