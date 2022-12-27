part of 'elbume_bloc.dart';

abstract class ElbumeState extends Equatable {
  const ElbumeState();
  
  @override
  List<Object> get props => [];
}

class ElbumeInitial extends ElbumeState {}
