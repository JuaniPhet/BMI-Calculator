part of 'gender_bloc.dart';

@immutable
abstract class GenderEvent {}

class FetchGender extends GenderEvent {
  final String name;

  FetchGender({
    required this.name,
  });
}
