part of 'attendance_bloc.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();  

  @override
  List<Object> get props => [];
}
class AttendanceInitial extends AttendanceState {}
