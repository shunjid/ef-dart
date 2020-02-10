class foodCrops {
  int id;
  String cropType;
  String cropName;

  foodCrops(this.id, this.cropType, this.cropName);
  foodCrops.fromList(List<String> items) : this(int.parse(items[0]), items[1].toString(), items[2].toString());

  Map<String, dynamic> toJson() => _foodCropsToJson(this);
}

Map<String, dynamic> _foodCropsToJson(foodCrops crops) => <String, dynamic> {
  'id' : crops.id,
  'cropType' : crops.cropType,
  'cropName' : crops.cropName
};