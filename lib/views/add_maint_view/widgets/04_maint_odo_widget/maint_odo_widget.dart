import 'package:flutter/material.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';

import '../../../../conf/flutter_conf.dart';

class MaintOdoWidget extends StatelessWidget {
  const MaintOdoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const CustomText(data: 'Car Odometer *'),
        const SizedBox(height: 10),
        Card(
          margin: EdgeInsets.zero,
          child: TextField(
            controller: context.read<CarMaintBloc>().maintCarOdoController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: const Icon(Icons.directions_car),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: 'Enter the car odometer',
            ),
          ),
        ),
      ],
    );
  }
}
