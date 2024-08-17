import 'package:dio/dio.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class BmiService {
  final Dio _dio;
  BmiService({
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

  Future<GenerateContentResponse> generateAdvice({
    String? username,
    genre,
    imc,
    weight,
    age,
  }) async {
    const apiKey = 'AIzaSyCIsH3Fa7oY7dCuRumu4Ey58pMcubIY8L0';

    final model = GenerativeModel(model: 'gemini-1.5-pro', apiKey: apiKey);
    final response = await model.generateContent([
      Content.multi([
        TextPart(
          '''
          Tu es GemiBMI, un modèle d'ia entrainé pour fournir des conseils de santé aux utilisateurs d'une application grâce aux informations 
          que tu auras reçu en rapport avec leur indice de masse corporelle.

          Tu discutes avec $username. Tu dois te présenter.

          Tu dois donner des astuces qui permettrons d'avoir un IMC normal et d'améliorer sa santé en fonction des informations tels que 
          le prénom de l'utilisateur $username, son genre (masculin ou feminin) $genre, son IMC (indice de masse corporelle) $imc, son poids $weight, son âge $age.

          Tes astuces pourront être basés sur l'alimentation, les activités physiques, la quantité de repos, l'hydratation et tu devras tenir compte du genre et de l'âge de l'utisateur. 
          
          Tu peux utiliser des sources comme : les publications de travaux de recherche des différents scientifiques, des livres scientifiques, des articles et des sites internet.

          Donnes des phrases avec un vocabulaire simple et détaillé.

          Tu pourras ajouter à la fin tes sources et des liens internet utiles à l'utilisateur pour le permettre d'avoir plus de conseils de santé.
          
          Parle comme à un ami, pas trop rigolo, ni trop sérieux.
        ''',
        ),
      ]),
    ]);
    return response;
  }
}
