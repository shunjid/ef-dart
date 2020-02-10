class foodCrops {
  int id;
  String cropType;
  String cropName;

  foodCrops(this.id, this.cropType, this.cropName);
  foodCrops.fromList(List<String> items) : this(int.parse(items[0]), items[1].toString(), items[2].toString());

  Map<String, dynamic> toJson() => _foodCropsToJson(this);
  factory foodCrops.fromJson(Map<String, dynamic> json) => _cropsFromJson(json);
}

Map<String, dynamic> _foodCropsToJson(foodCrops crops) => <String, dynamic> {
  'id' : crops.id,
  'cropType' : crops.cropType,
  'cropName' : crops.cropName
};

foodCrops _cropsFromJson(Map<String, dynamic> json) {
  return foodCrops(
      json['id'] as int,
      json['cropType'] as String,
      json['cropName'] as String
  );
}