class foodCrops {
  int id;
  String cropType;
  String cropName;

  foodCrops(this.id, this.cropType, this.cropName);
  foodCrops.fromList(List<String> items) : this(int.parse(items[0]), items[1], items[2]);
}