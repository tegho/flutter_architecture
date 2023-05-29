import 'package:module_data/module_data.dart';

class MainBloc {
  final DataService dataService;

  MainBloc({required this.dataService});

  int refresh() {
    return (dataService.isGood()) ? dataService.getNextVal() : 222;
  }

  void dispose() {}
}
