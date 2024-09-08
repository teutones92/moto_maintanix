import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';

import '../add_edit_car_view.dart';

class FootButtons extends StatelessWidget {
  const FootButtons({
    super.key,
    required this.widget,
  });

  final AddEditCar widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.vehicle != null)
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Remove Vehicle'),
                    content: const Text(
                        'Are you sure you want to remove this vehicle?'),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.green,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        onPressed: () {
                          context
                              .read<CarListItemBloc>()
                              .deleteVehicle(context, widget.vehicle!);
                        },
                        child: const Text('Remove Vehicle'),
                      ),
                    ],
                  );
                },
              ),
              child: const Text('Remove Vehicle'),
            ),
          ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              context
                  .read<CarListItemBloc>()
                  .saveCar(context, widget.vehicle?.id);
            },
            child: Text(
              widget.vehicle != null ? 'Update Vehicle' : 'Save Vehicle',
            ),
          ),
        ),
      ],
    );
  }
}
