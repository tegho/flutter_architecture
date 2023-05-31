import 'package:injectable/injectable.dart';

import 'package:module_data/module_data.dart';

@injectable
class MainBloc {
  final DataService dataService;

  MainBloc({required this.dataService});

  int refresh() {
    return (dataService.isGood()) ? dataService.getNextVal() : 999;
  }
}
