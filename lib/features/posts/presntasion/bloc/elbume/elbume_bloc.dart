import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'elbume_event.dart';
part 'elbume_state.dart';

class ElbumeBloc extends Bloc<ElbumeEvent, ElbumeState> {
  ElbumeBloc() : super(ElbumeInitial()) {
    on<ElbumeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
