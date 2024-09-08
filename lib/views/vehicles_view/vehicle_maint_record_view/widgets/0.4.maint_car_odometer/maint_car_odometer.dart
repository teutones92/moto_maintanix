import 'package:flutter/material.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';

import '../../../../../conf/flutter_conf.dart';

class MaintCarOdometer extends StatelessWidget {
  const MaintCarOdometer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<CarMaintBloc, MaintTable?>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/icons/pngwing_white.png'
                          : 'assets/icons/pngwing_dark.png',
                      width: 25),
                  const SizedBox(width: 10),
                  const CustomText(data: 'Car Odometer'),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '${addComaToOdometer(state!.carOdometer.toString())} miles',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.5)),
            ],
          );
        },
      ),
    );
  }

  String addComaToOdometer(String odometer) {
    final List<String> odometerList = odometer.split('');
    final List<String> newOdometerList = [];
    for (int i = 0; i < odometerList.length; i++) {
      if (i % 3 == 0 && i != 0) {
        newOdometerList.add(',');
      }
      newOdometerList.add(odometerList[i]);
    }
    return newOdometerList.join();
  }
}
