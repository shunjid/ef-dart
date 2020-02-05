import 'dart:io';

import 'api/FarmersController.dart';

void main(List<String> args) async {
  var farmer = FarmersController(new File('data/foodCrops.csv'), new File('data/farmer.csv'));
}