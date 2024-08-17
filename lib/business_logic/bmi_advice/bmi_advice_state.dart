part of 'bmi_advice_bloc.dart';

@immutable
abstract class BmiAdviceState {}

final class BmiAdviceInitial extends BmiAdviceState {}

final class FetchBmiAdviceLoading extends BmiAdviceState {}

final class FetchBmiAdviceFailure extends BmiAdviceState {
  final String message;

  FetchBmiAdviceFailure({required this.message});
}

final class FetchBmiAdviceSuccess extends BmiAdviceState {
  final GenerateContentResponse response;

  FetchBmiAdviceSuccess({required this.response});
}
