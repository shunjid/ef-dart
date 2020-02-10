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
}