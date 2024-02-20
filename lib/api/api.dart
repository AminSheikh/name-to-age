import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/name_age.dart';

part 'api.g.dart';

// Additional endpoints can be added here if necessary
@RestApi()
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('/?name={name}')
  Future<NameAge> getAgeEstimation(
    @Path('name') String name
  );

}
