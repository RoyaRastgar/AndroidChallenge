import 'package:hive/hive.dart';

part 'device_model.g.dart';

@HiveType(typeId: 1)
class DeviceModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String type;
  DeviceModel({required this.name, required this.description, required this.type});
}