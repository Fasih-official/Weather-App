import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
