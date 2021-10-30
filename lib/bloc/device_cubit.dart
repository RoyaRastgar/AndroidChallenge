import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/data/models/device_model.dart';
import 'package:meta/meta.dart';

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(DeviceInitial());

  String _deviceBox = 'device';

  List deviceList = <DeviceModel>[];

  Future<void> addDevice(DeviceModel deviceModel) async {
    emit(DeviceLoadingState());
    var box = await Hive.openBox<DeviceModel>(_deviceBox);
    box.add(deviceModel);
    emit(DeviceAddState());
    getDevice();
  }

  Future<void> getDevice() async {
    emit(DeviceLoadingState());
    final box = await Hive.openBox<DeviceModel>(_deviceBox);
    deviceList = box.values.toList();
    emit(DeviceGetState(deviceList: deviceList));
  }

  Future<void> updateDevice(int index, DeviceModel deviceModel) async {
    emit(DeviceLoadingState());
    final box = Hive.box<DeviceModel>(_deviceBox);
    box.putAt(index, deviceModel);
    emit(DeviceUpdateState());

  }

  Future<void> deleteDevice(int index) async {
    emit(DeviceLoadingState());
    final box = Hive.box<DeviceModel>(_deviceBox);
    box.deleteAt(index);
    emit(DeviceDeleteState());
    getDevice();
  }

}
