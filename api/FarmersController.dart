import 'dart:io';
import '../models/farmer.dart';
import '../models/foodCrops.dart';

class FarmersController {
  static List<farmer> _farmers;
  static List<foodCrops> _foodCrops;

  FarmersController(File cropsDataSet, File farmersDataSet) {
    _foodCrops = retrieveCrops(cropsDataSet);
    _farmers   = retrieveFarmers(farmersDataSet);

    print(_foodCrops.length);
    print(_farmers.length);
  }

  List<foodCrops> retrieveCrops(File cropsDataSet) {
    try {
      List<String> linesOfCSV = cropsDataSet.readAsLinesSync();
      linesOfCSV.removeAt(0);

      var listOfFoodCrops = <foodCrops>[];
      for (var eachLine in linesOfCSV) listOfFoodCrops.add(foodCrops.fromList(eachLine.split(',')));

      return listOfFoodCrops;
    } on IOException {
      return null;
    }
  }

  List<farmer> retrieveFarmers(File farmersDataSet) {
    try {
      List<String> linesOfCSV = farmersDataSet.readAsLinesSync();
      linesOfCSV.removeAt(0);

      var listOfFarmers = <farmer>[];

      for (var eachLine in linesOfCSV) {
        var eachElements = eachLine.split(',');
        var cropNumber = int.parse(eachElements[4]);

        listOfFarmers.add (
            farmer (
            int.parse(eachElements[0]),
            eachElements[1],
            int.parse(eachElements[2]),
            double.parse(eachElements[3]),
            _foodCrops[cropNumber - 1])
        );
      }

      return listOfFarmers;
    } on IOException {
      return null;
    }
  }

}