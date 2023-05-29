import 'package:get_it/get_it.dart';
import 'package:module_data/module_data.dart';
import 'package:module_data/src/data_service.dart';

class ServiceProvider {
  static final _getIt = GetIt.I;
  static final instance = ServiceProvider();

  T get<T extends Object>() => _getIt.get<T>();

  void initialize() {
    _getIt.registerLazySingleton<DataService>(
      () => DataServiceLocal(),
    );
  }
}
