// lib/booking_bus/models/bus_model.dart
class Bus {
  final String id;
  final String name;
  final String departureTime;
  final String arrivalTime;
  final String route;

  Bus({
    required this.id,
    required this.name,
    required this.departureTime,
    required this.arrivalTime,
    required this.route,
  });
}
