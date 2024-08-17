import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../data/repositories/bmi_repository.dart';
import '../../data/services/bmi_service.dart';

part 'bmi_advice_event.dart';
part 'bmi_advice_state.dart';

class BmiAdviceBloc extends Bloc<BmiAdviceEvent, BmiAdviceState> {
  final BmiRepository repository = BmiRepository(
    BmiService: BmiService(
      dio: Dio(),
    ),
  );
  BmiAdviceBloc() : super(BmiAdviceInitial()) {
    on<FetchBmiAdviceEvent>((event, emit) async {
      try {
        emit(FetchBmiAdviceLoading());
        var res = await repository.generateAdvice(
          username: event.username,
          genre: event.genre,
          imc: event.imc,
          weight: event.weight,
          age: event.age,
        );
        emit(FetchBmiAdviceSuccess(response: res));
      } catch (e) {
        emit(FetchBmiAdviceFailure(message: e.toString()));
      }
    });
  }
}
