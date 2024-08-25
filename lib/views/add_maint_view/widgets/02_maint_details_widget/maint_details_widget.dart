import 'package:flutter/material.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';

import '../../../../conf/flutter_conf.dart';

class MaintDetailsWidget extends StatelessWidget {
  const MaintDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(data: 'Maintenance Details *'),
        const SizedBox(height: 10),
        Card(
          margin: EdgeInsets.zero,
          child: TextField(
            controller: context.read<CarMaintBloc>().maintDetailsController,
            decoration: InputDecoration(
              filled: true,
              hintText:
                  'Ej: Oil type must be..., tire rotation from left to..., etc.',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
            ),
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
