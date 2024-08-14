import '../models/gender_model.dart';
import '../services/gender_service.dart';

class GenderRepository {
  final GenderService _genderService;
  GenderRepository({
    required GenderService genderService,
  }) : _genderService = genderService;

  Future<GenderModel> fetchGender({
    required String name,
  }) async {
    var jsonData = await _genderService.fetchGender(name: name);
    return GenderModel.fromJson(jsonData);
  }
}

// class GenderRepository {
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
