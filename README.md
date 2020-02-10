# ef-dart
![my badge](https://action-badges.now.sh/shunjid/ef-dart)

A sample command-line application which is what I started my journey with dart. Being a .NET Core developer,
I thought it would be wise if I solve problems keeping in mind the concepts I have experienced in Entity Framework Core (EF Core).

## Table of contents
- [Where](#where---where-with-range)
- [FirstOrDefault](#firstordefault---singleordefault)
- [ForEach](#foreach)
- [Select](#select---select-anonymous-types)
- [More Coming Soon ..](#ef-dart)

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

**Problem:** Update monthly income of farmers who grows crop ${cropName} to ${increaseTimes} time of previous
```dart
String updateMonthlyIncomeWhoGrows(String cropName, double increaseTimes) {
    var aFarm = farm.fromJson(jsonDecode(findByCrops(cropName)));

    aFarm.farmers.forEach((farmer aFarmer){
      aFarmer.farmerMonthlyIncome *= increaseTimes;
    });
    return jsonEncode(aFarm.toJson());
}
``` 

### Select - Select Anonymous Types
**Problem:** Find all farmers within given range of age and return as array 
```sql
Select farmerAge from _farmers
where farmerAge >= lowerRange AND farmerAge <= upperRange 
ORDER BY farmerAge ASC;
``` 
```dart
List<int> increaseAgesRetrieveAsArray(int lowerLimit, int upperLimit) {
    return _farmers
           .where((f) => f.farmerAge >= lowerLimit && f.farmerAge <= upperLimit)
           .map((f) => f.farmerAge + 1).toList()..sort();
}
``` 

**Problem:** Find all farmers within given range of age and return what they grow as array with no duplicate
```dart
List<String> farmerGrowingAgeRangeDistinct(int lowerLimit, int upperLimit) {
    return _farmers
        .where((f) => f.farmerAge >= lowerLimit && f.farmerAge <= upperLimit)
        .map((f) => f.crops.cropName)
        .toSet()
        .toList()
        ..sort();
}
``` 

**Problem:** Find all farmers within given range of incomeLimit and return their income and what they grow in a list of custom object
```dart
List<Map<String, dynamic>> filterKeysInsideArrayOfObjects(double incomeLimit) {
    return _farmers
           .where((f) => f.farmerMonthlyIncome <= incomeLimit)
           .map((f) => {
             'income' : f.farmerMonthlyIncome,
             'grows' : f.crops.cropName
           })
           .toList();
}

void main() {
    var cropIncomeCustomObject = farm.filterKeysInsideArrayOfObjects(20000);
    
    cropIncomeCustomObject.forEach((ic) =>
        print('{income : ${ic['income']}, grows : ${ic['grows']}}')
    );
}
```

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
