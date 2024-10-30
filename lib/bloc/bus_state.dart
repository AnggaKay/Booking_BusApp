import '../models/bus_model.dart';

abstract class BusState {}

class BusInitial extends BusState {}

class BusLoading extends BusState {}

class BusLoaded extends BusState {
  final List<Bus> buses;

  BusLoaded(this.buses);
}

class BusError extends BusState {
  final String message;

  BusError(this.message);
}
