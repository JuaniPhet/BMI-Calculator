import 'package:google_generative_ai/google_generative_ai.dart';

import '../models/gender_model.dart';
import '../services/bmi_service.dart';

class BmiRepository {
  final BmiService _BmiService;
  BmiRepository({
    required BmiService BmiService,
  }) : _BmiService = BmiService;

  Future<GenderModel> fetchGender({
    required String name,
  }) async {
    var jsonData = await _BmiService.fetchGender(name: name);
    return GenderModel.fromJson(jsonData);
  }

  Future<GenerateContentResponse> generateAdvice({
    String? username,
    genre,
    imc,
    weight,
    age,
  }) async {
    var res = _BmiService.generateAdvice(
      username: username,
      genre: genre,
      imc: imc,
      weight: weight,
      age: age,
    );

    return res;
  }
}

// class BmiRepository {
//   final Dio dio = Dio();

//   Future<GenderModel> getGender({
//     required String name,
//   }) async {
//     Response response = await dio.get(
//       "https://api.genderize.io?name=$name",
//     );

//     return GenderModel.fromJson(response.data);
//   }
// }
