import 'foodCrops.dart';

class farmer {
  int farmerId;
  String farmerLocation;
  int farmerAge;
  double farmerMonthlyIncome;
  foodCrops _crops;

  farmer(this.farmerId, this.farmerLocation, this.farmerAge, this.farmerMonthlyIncome, this._crops);

  farmer.fromList(List<dynamic> items) : this (int.parse(items[0]),
    items[0].toString(),
    int.parse(items[2]),
    double.parse(items[3]),
    items[4] as foodCrops
  );
}