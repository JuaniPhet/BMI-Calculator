import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/services/bmi_service.dart';
import '../../data/repositories/bmi_repository.dart';
import '../../data/models/gender_model.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  final BmiRepository repository = BmiRepository(
    BmiService: BmiService(
      dio: Dio(),
    ),
  );

  GenderBloc() : super(GenderInitial()) {
    on<FetchGender>((event, emit) async {
      try {
        emit(FetchGenderLoading());

        var gender = await repository.fetchGender(name: event.name);

        emit(FetchGenderSuccess(genderModel: gender));
      } catch (e) {
        emit(FetchGenderFailure(message: e.toString()));
      }
    });
  }
}
