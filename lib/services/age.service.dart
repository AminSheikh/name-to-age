import '../models/name_age.dart';
import 'api.service.dart';

class AgeService {
  final api = useApi();

  AgeService._();

  static final instance = AgeService._();

  factory AgeService() {
    return instance;
  }

  Future<NameAge> getAgeEstimation(String name) async {
    try {
      final response = await api.getAgeEstimation(name);
      return response;
    } catch (err) {
      return Future.error(err);
    }
  }
}

AgeService useAgeService() {
  return AgeService();
}
