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

  String farmByLocation(String location) {
      return jsonEncode(farm(_farmers.where((d) =>
             d.farmerLocation == StringUtils.capitalize(location)).toList())
      .toJson());
  }
}