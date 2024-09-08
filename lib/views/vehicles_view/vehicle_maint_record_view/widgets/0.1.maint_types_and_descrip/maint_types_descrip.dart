import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';

class MaintTypeAndDescription extends StatelessWidget {
  const MaintTypeAndDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarMaintBloc, MaintTable?>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(data: 'Maintenance Type'),
              Text(state!.maintType),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.5)),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 10),
                  CustomText(data: 'Maintenance Description'),
                ],
              ),
              const SizedBox(height: 10),
              Text(state.maintDescription!),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.5)),
            ],
          ),
        );
      },
    );
  }
}
