import 'dart:io';
import 'SerializeDataset.dart';
import '../models/farmer.dart';
import '../models/foodCrops.dart';

class FarmersContext extends SerializeDataset {
   List<farmer> _farmers;
   List<foodCrops> _foodCrops;

   FarmersContext() {
      _foodCrops = retrieveCrops(new File('data/foodCrops.csv'));
      _farmers = retrieveFarmers(new File('data/farmer.csv'), _foodCrops);
   }
}