// lib/booking_bus/blocs/bus_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bus_event.dart';
import 'bus_state.dart';
import '../models/bus_model.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  BusBloc() : super(BusInitial());

  @override
  Stream<BusState> mapEventToState(BusEvent event) async* {
    if (event is LoadBuses) {
      yield BusLoading();
      try {
        await Future.delayed(Duration(seconds: 2));
        final buses = [
          Bus(
              id: '1',
              name: 'Bus A',
              departureTime: '08:00',
              arrivalTime: '10:00',
              route: 'Route A'),
          Bus(
              id: '2',
              name: 'Bus B',
              departureTime: '09:00',
              arrivalTime: '11:00',
              route: 'Route B'),
        ];
        yield BusLoaded(buses);
      } catch (e) {
        yield BusError('Failed to load buses');
      }
    } else if (event is SelectBus) {
      // Tangani pemilihan bus di sini
    }
  }
}
