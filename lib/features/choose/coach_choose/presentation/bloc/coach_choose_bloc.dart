import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coach_choose_event.dart';
part 'coach_choose_state.dart';

class CoachChooseBloc extends Bloc<CoachChooseEvent, CoachChooseState> {
  CoachChooseBloc() : super(CoachChooseInitial()) {
    on<CoachChooseEvent>((event, emit) {});
  }
}
