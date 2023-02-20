import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fitness_center_choose_event.dart';
part 'fitness_center_choose_state.dart';

class FitnessCenterChooseBloc
    extends Bloc<FitnessCenterChooseEvent, FitnessCenterChooseState> {
  FitnessCenterChooseBloc() : super(FitnessCenterChooseInitial()) {
    on<FitnessCenterChooseEvent>((event, emit) {});
  }
}
