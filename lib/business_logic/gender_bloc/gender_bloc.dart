import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fourth/data/services/gender_service.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/gender_repository.dart';
import '../../data/models/gender_model.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  final GenderRepository repository = GenderRepository(
    genderService: GenderService(
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
