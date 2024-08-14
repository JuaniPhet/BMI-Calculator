import 'package:dio/dio.dart';

class GenderService {
  final Dio _dio;
  GenderService({
    required Dio dio,
  }) : _dio = dio;

  Future<dynamic> fetchGender({
    required String name,
  }) async {
    Response response = await _dio.get(
      "https://api.genderize.io?name=$name",
    );
    return response.data;
  }
}
