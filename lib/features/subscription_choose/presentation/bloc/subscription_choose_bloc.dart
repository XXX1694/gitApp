import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subscription_choose_event.dart';
part 'subscription_choose_state.dart';

class SubscriptionChooseBloc
    extends Bloc<SubscriptionChooseEvent, SubscriptionChooseState> {
  SubscriptionChooseBloc() : super(SubscriptionChooseInitial()) {
    on<SubscriptionChooseEvent>((event, emit) {});
  }
}
