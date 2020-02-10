import 'api/initials.dart';

void main(List<String> args) {
  var farmContext = initials();
  print(farmContext.farmByLocation("janina"));
}