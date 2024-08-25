import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';

class MaintDates extends StatelessWidget {
  const MaintDates({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<CarMaintBloc, MaintTable?>(
        builder: (context, state) {
          return Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3),
                itemCount: 2,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        data: index == 0
                            ? 'Maintenance Date'
                            : 'Next Maintenance Date',
                      ),
                      Text(index == 0
                          ? state!.maintDate
                          : state!.nextMaintDate.isEmpty
                              ? 'N/A'
                              : state.nextMaintDate),
                    ],
                  );
                },
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
              ),
            ],
          );
        },
      ),
    );
  }
}
