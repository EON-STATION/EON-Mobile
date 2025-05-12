import 'package:eon_business/src/core/model/station.dart';
import 'package:eon_business/src/feature/station/data/station_data_provider.dart';

abstract interface class StationRepository {
  Future<List<Station>> fetchStations();
}

final class StationRepositoryImpl implements StationRepository {
  StationRepositoryImpl({required StationDataProvider dataProvider}) : _dataProvider = dataProvider;

  final StationDataProvider _dataProvider;

  @override
  Future<List<Station>> fetchStations() async {
    return _dataProvider.fetchStations();
  }
}
