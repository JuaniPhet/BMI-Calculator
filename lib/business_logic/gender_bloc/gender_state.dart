part of 'gender_bloc.dart';

@immutable
abstract class GenderState {}

class GenderInitial extends GenderState {}

class FetchGenderLoading extends GenderState {}

class FetchGenderSuccess extends GenderState {
  final GenderModel genderModel;

  FetchGenderSuccess({
    required this.genderModel,
  });
}

class FetchGenderFailure extends GenderState {
  final String message;

  FetchGenderFailure({
    required this.message,
  });
}
