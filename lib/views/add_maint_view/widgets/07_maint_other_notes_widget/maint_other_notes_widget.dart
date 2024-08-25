import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';

class MaintOtherNotesWidget extends StatelessWidget {
  const MaintOtherNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const CustomText(data: 'Other Notes'),
        const SizedBox(height: 10),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              controller: context.read<CarMaintBloc>().maintOtherNotes,
              maxLines: 2,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Eje: Garcia Motors Workshop',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
