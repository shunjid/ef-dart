import 'dart:convert';
import 'dart:io';
import 'package:basic_utils/basic_utils.dart';

import 'receiver.dart';
import '../models/farmer.dart';
import '../models/foodCrops.dart';
import '../models/farm.dart';

class initials extends receiver {
  List<farmer> _farmers;
  List<foodCrops> _foodCrops;

  initials() {
    _foodCrops = retrieveCrops(new File('data/foodCrops.csv'));
    _farmers = retrieveFarmers(new File('data/farmer.csv'), _foodCrops);
  }

  String findByLocation(String location) {
      return jsonEncode(farm(_farmers.where((d) =>
             d.farmerLocation == StringUtils.capitalize(location.trim())).toList())
      .toJson());
  }

  String findByCrops(String cropName) {
    var crop = _foodCrops.firstWhere((cr) => cr.cropName == cropName.toLowerCase().trim(), orElse: null);
    var message = "";
    crop == null ? message = "Crop named ${cropName} not found" :
                             message = jsonEncode(farm(_farmers.where((f) =>
                             f.crops == crop).toList()).toJson());
    return message;
  }

  String findByEarningRange(double lowerRange, double upperRange) {
    return jsonEncode(farm(_farmers.where((d) =>
        d.farmerMonthlyIncome >= lowerRange && d.farmerMonthlyIncome <= upperRange).toList())
        .toJson());
  }

  List<dynamic> findByCropType(String cropType) {
    var farmerIds = [];
    _farmers.forEach((farmer aFarmer){
      aFarmer.crops.cropType == cropType ? farmerIds.add(aFarmer.farmerId) : null;
    });
    return farmerIds;
  }

  String updateMonthlyIncomeWhoGrows(String cropName, double increaseTimes){
    var aFarm = farm.fromJson(jsonDecode(findByCrops(cropName)));

    aFarm.farmers.forEach((farmer aFarmer){
      aFarmer.farmerMonthlyIncome *= increaseTimes;
    });
    return jsonEncode(aFarm.toJson());
  }

  List<int> increaseAgesRetrieveAsArray(int lowerLimit, int upperLimit) {
    /*
    ** Method cascade : ..sort
    ** ref : https://news.dartlang.org/2012/02/method-cascades-in-dart-posted-by-gilad.html
     */

    return _farmers
           .where((f) => f.farmerAge >= lowerLimit && f.farmerAge <= upperLimit)
           .map((f) => f.farmerAge + 1).toList()..sort();
  }

  List<String> farmerGrowingAgeRangeDistinct(int lowerLimit, int upperLimit) {
    return _farmers
        .where((f) => f.farmerAge >= lowerLimit && f.farmerAge <= upperLimit)
        .map((f) => f.crops.cropName)
        .toSet()
        .toList()
        ..sort();
  }

  List<Map<String, dynamic>> filterKeysInsideArrayOfObjects(double incomeLimit) {
    return _farmers
           .where((f) => f.farmerMonthlyIncome <= incomeLimit)
           .map((f) => {
             'income' : f.farmerMonthlyIncome,
             'grows' : f.crops.cropName
           })
           .toList();
  }
}