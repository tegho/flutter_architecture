import 'package:injectable/injectable.dart';
import 'package:module_data/module_data.dart';
import 'dart:math';

@LazySingleton(as: DataService)
class DataServiceLocal implements DataService {
  late final Random rnd;

  DataServiceLocal() {
    rnd = Random();
  }

  @override
  int getNextVal() {
    return rnd.nextInt(100);
  }

  @override
  bool isGood() {
    return rnd.nextBool();
  }
}
