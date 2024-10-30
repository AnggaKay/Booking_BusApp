import '../models/bus_model.dart';

abstract class BusEvent {}

class LoadBuses extends BusEvent {}

class SelectBus extends BusEvent {
  final Bus bus;

  SelectBus(this.bus);
}
