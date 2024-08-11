import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/gender_repository.dart';
import '../../data/models/gender_model.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  final GenderModel genderModel;

  GenderBloc({required this.genderModel}) : super(GenderInitial()) {
    on<FetchGender>((event, emit) async {
      try {
        emit(FetchGenderLoading());

        var gender = await GenderRepository().getGender(name: genderModel.name);

        emit(FetchGenderSuccess(genderModel: gender));
      } catch (e) {
        emit(FetchGenderFailure(message: e.toString()));
      }
    });
  }
}
