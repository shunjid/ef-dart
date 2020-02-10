# ef-dart

A sample command-line application which is what I started my journey with dart. Being a .NET Core developer,
I thought it would be wise if I solve problems keeping in mind the concepts I have experienced in Entity Framework Core (EF Core).


### where - where with range
**Problem:** Find the farmers by passing 'location' as parameter
```dart
    String findByLocation(String location) {
          return jsonEncode(farm(_farmers.where((d) =>
                 d.farmerLocation == StringUtils.capitalize(location.trim())).toList())
          .toJson());
    }
``` 

**Problem:** Find the farmers who (earn <= ${lowerRange} and earn >=${upperRange})
```dart
    String findByEarningRange(double lowerRange, double upperRange) {
        return jsonEncode(farm(_farmers.where((d) =>
            d.farmerMonthlyIncome >= lowerRange && d.farmerMonthlyIncome <= upperRange).toList())
            .toJson());
    }
``` 


### FirstOrDefault - SingleOrDefault
**Problem:** Find the farmers who grows the crop ${cropName}
```dart
    String findByCrops(String cropName) {
        var crop = _foodCrops.firstWhere((cr) => cr.cropName == cropName.toLowerCase().trim(), orElse: null);
        var message = "";
        crop == null ? message = "Crop named ${cropName} not found" :
                                 message = jsonEncode(farm(_farmers.where((f) =>
                                 f.crops == crop).toList()).toJson());
        return message;
    }
``` 

### forEach
**Problem:** Find the farmers Ids who grow crops of type ${cropType}
```dart
    List<dynamic> findByCropType(String cropType) {
        var farmerIds = [];
        var findFarmerByCropType = _farmers.forEach((farmer aFarmer){
          aFarmer.crops.cropType == cropType ? farmerIds.add(aFarmer.farmerId) : null;
        });
        return farmerIds;
    }
``` 

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
