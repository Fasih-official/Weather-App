class CounterState {
  int counter;

  CounterState(this.counter);
}

class CounterInitialState extends CounterState {
  CounterInitialState(int counter) : super(counter);
}

class CounterStateIncremented extends CounterState {
  CounterStateIncremented(int counter) : super(counter);
}

class CounterStateDecremented extends CounterState {
  CounterStateDecremented(int counter) : super(counter);
}
