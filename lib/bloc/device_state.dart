part of 'device_cubit.dart';

@immutable
abstract class DeviceState {}

class DeviceInitial extends DeviceState {}

class DeviceLoadingState extends DeviceState {}

class DeviceGetState extends DeviceState {
  List deviceList = <DeviceModel>[];
  DeviceGetState({required this.deviceList});

}

class DeviceAddState extends DeviceState {}

class DeviceDeleteState extends DeviceState {}

class DeviceUpdateState extends DeviceState {}
