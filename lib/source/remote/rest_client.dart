import 'package:busca_cep_flutter/model/zip_code_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://viacep.com.br')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
  @GET('/ws/{zipcode}/json')
  Future<ZipCodeData> getZipCodeData(@Path() String zipcode);
}
