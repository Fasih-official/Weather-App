import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/counter_state.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  @override
  CounterState get initialState {
    return CounterInitialState(counter);
  }

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterStateIncremented(++counter);
    }
    if (event is DecrementEvent) {
      yield CounterStateDecremented(--counter);
    }
  }
}
