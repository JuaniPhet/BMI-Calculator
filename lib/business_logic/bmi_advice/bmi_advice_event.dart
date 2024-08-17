part of 'bmi_advice_bloc.dart';

@immutable
abstract class BmiAdviceEvent {}

class FetchBmiAdviceEvent extends BmiAdviceEvent {
  final String? username;
  final String genre;
  final num imc;
  final num weight;
  final int age;

  FetchBmiAdviceEvent({
    required this.username,
    required this.genre,
    required this.imc,
    required this.weight,
    required this.age,
  });
}
