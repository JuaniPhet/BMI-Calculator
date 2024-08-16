import 'bmi_detail_model.dart';

class BmiModel {
  final double height;
  final double weight;

  double get heigthInMeter => height / 100;
  double get imc => weight / (heigthInMeter * heigthInMeter);

  BmiDetailModel get status {
    if (imc < 18.5) {
      return BmiDetailModel(
        status: "Poids Insuffisant",
        advice: "Pour un poids insuffisant ...",
      );
    } else if (imc >= 18.5 && imc <= 24.9) {
      return BmiDetailModel(
        status: "Poids normal",
        advice: "Pour un poids normal ...",
      );
    } else if (imc >= 25 && imc <= 29.9) {
      return BmiDetailModel(
        status: "Surpoids",
        advice: "Pour un surpoids ...",
      );
    } else if (imc >= 30 && imc <= 34.9) {
      return BmiDetailModel(
        status: "Obésité de classe I",
        advice: "Pour un Obésité de classe I ...",
      );
    } else if (imc >= 35 && imc <= 39.9) {
      return BmiDetailModel(
        status: "Obésité de classe II",
        advice: "Pour un Obésité de classe II ...",
      );
    } else {
      return BmiDetailModel(
        status: "Obésité de classe III",
        advice: "Pour une Obésité de classe III",
      );
    }
  }

  BmiModel({
    required this.height,
    required this.weight,
  });
}
