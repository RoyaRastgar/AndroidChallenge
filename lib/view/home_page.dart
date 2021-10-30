import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_example/bloc/device_cubit.dart';
import 'package:hive_example/data/models/device_model.dart';

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceCubit, DeviceState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                Text(
                  'Hive Device',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if(state is DeviceGetState)
                Container(
                  height: 100,
                  child: ListView.builder(
                    itemCount: state.deviceList.length,
                    itemBuilder: (context, index) {
                      DeviceModel dv = state.deviceList[index];
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        height: 15,
                        // width: 50.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 2),
                              width: 16,
                              decoration: BoxDecoration(
                                color: Colors.green[600],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    dv.name,
                                    style: TextStyle(
                                      color: Colors.green[600],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    dv.description,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: PopupMenuButton(
                                onSelected: (item) {
                                  switch (item) {
                                    case 'update':
                                      nameController.text = dv.name;
                                      descriptionController.text =
                                          dv.description;

                                      // inputItemDialog(context, 'update', index);
                                      break;
                                    case 'delete':
                                      // model.deleteItem(index);
                                  }
                                },
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      value: 'update',
                                      child: Text('Update'),
                                    ),
                                    PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                  ];
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              DeviceModel deviceModel = DeviceModel(name: 'car', description: 'a car', type: 'vehicle');
              BlocProvider.of<DeviceCubit>(context).addDevice(deviceModel);
              // inputItemDialog(context, 'add');
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 16,
            ),
          ),
        );
      },
    );
  }

}