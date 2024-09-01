import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';

class MaintEstimatedTimeWidget extends StatelessWidget {
  const MaintEstimatedTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const CustomText(data: 'Estimated time (optional)'),
        const SizedBox(height: 10),
        Card(
          margin: EdgeInsets.zero,
          child: TextField(
            controller: context.read<CarMaintBloc>().maintEstimatedTime,
            decoration: const InputDecoration(
              hintText: 'Example: 2 hours',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
