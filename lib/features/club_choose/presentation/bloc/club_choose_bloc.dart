import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'club_choose_event.dart';
part 'club_choose_state.dart';

class ClubChooseBloc extends Bloc<ClubChooseEvent, ClubChooseState> {
  ClubChooseBloc() : super(ClubChooseInitial()) {
    on<ClubChooseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
