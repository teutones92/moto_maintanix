import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/external_server/cars_data_model/cars_data_model.dart';

class VehicleModelModal extends StatelessWidget {
  const VehicleModelModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBrandBloc, CarsDataModel?>(
      builder: (context, state) {
        if (state == null) {
          return const Center(
            child: Text('You must select a brand first'),
          );
        }
        return ListView.builder(
          itemCount: state.models.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(state.models[index]),
                  onTap: () {
                    context
                        .read<VehicleModelBloc>()
                        .setModel(state.models[index]);
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
