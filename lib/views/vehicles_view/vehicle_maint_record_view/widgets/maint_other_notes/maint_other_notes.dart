import 'package:flutter/material.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';

import '../../../../../conf/flutter_conf.dart';

class MaintOtherNotes extends StatelessWidget {
  const MaintOtherNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<CarMaintBloc, MaintTable?>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const CustomText(data: 'Other Notes'),
              const SizedBox(height: 10),
              Text(state!.otherNotes!.isEmpty ? 'No notes' : state.otherNotes!),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.5)),
            ],
          );
        },
      ),
    );
  }
}
