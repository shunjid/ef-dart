import '../models/farmer.dart';
import '../models/foodCrops.dart';

class FarmersController {
  static List<farmer> farmers;
  static List<foodCrops> crops;

  FarmersController() {
    crops = [
      foodCrops(1, 'food', 'rice'), foodCrops(2, 'food', 'pulses'), foodCrops(3, 'cash', 'sugarcane'),
      foodCrops(4, 'cash', 'jute'), foodCrops(5, 'horticulture', 'watermelon'), foodCrops(6, 'horticulture', 'orange')
    ];

    farmers = [
      farmer(1, 'Dhaka', 49, 31500, crops[0]), farmer(2, 'Chittagong', 50, 6500, crops[1]), farmer(3, 'Dhaka', 51, 6000, crops[2]), farmer(4, 'Chittagong', 52, 21000, crops[3]), farmer(5, 'Dhaka', 54, 11200, crops[5]),
      farmer(6, 'Chittagong', 54, 10100, crops[5]), farmer(7, 'Dhaka', 55, 91500, crops[4]), farmer(8, 'Jessore', 56, 61500, crops[1]), farmer(9, 'Dhaka', 57, 10500, crops[4]), farmer(10, 'Jessore', 57, 21500, crops[3]),
    ];
  }
}