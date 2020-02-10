import 'api/FarmersContext.dart';

void main(List<String> args) async {
  var _context = new FarmersContext();
  print(_context.getFarmersLivingIn("Dhaka"));
}