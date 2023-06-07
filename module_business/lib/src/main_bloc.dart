import 'package:injectable/injectable.dart';

import 'package:module_data/module_data.dart';

@injectable
class MainBloc {
  final DataService dataService;

  MainBloc({required this.dataService});

  Future<int> distance() async {
    final res = await Future.wait([
      dataService.getMyLocation(),
      dataService.getHisLocation(),
    ]);
    return (res[0].position - res[1].position).abs();
  }
}
