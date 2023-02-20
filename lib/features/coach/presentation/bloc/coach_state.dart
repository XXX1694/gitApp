part of 'coach_bloc.dart';

abstract class CoachState extends Equatable {
  const CoachState();  

  @override
  List<Object> get props => [];
}
class CoachInitial extends CoachState {}
