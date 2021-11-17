import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movietab_event.dart';
part 'movietab_state.dart';

class MovietabBloc extends Bloc<MovietabEvent, MovietabState> {
  MovietabBloc() : super(MovietabInitial()) {
    on<MovietabEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
