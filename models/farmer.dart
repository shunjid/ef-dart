import 'foodCrops.dart';

class farmer {
  int farmerId;
  String farmerLocation;
  int farmerAge;
  double farmerMonthlyIncome;
  foodCrops _crops;

  farmer(this.farmerId, this.farmerLocation, this.farmerAge, this.farmerMonthlyIncome, this._crops);
}