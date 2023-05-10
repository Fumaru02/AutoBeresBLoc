import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  car,
  motorcycle,
}

class Vehicle {
  final String id;
  final String nameVehicle;
  final String merk;
  final String modelType;
  final String octaneNumber;
  final String transmission;
  final DateTime year;
  final String plateNumber;
  final Category category;

  Vehicle({
    required this.nameVehicle,
    required this.merk,
    required this.modelType,
    required this.octaneNumber,
    required this.transmission,
    required this.year,
    required this.plateNumber,
    required this.category,
  }) : id = uuid.v4();
}
