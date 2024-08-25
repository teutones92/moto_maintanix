import 'package:flutter/material.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';

import '../../../../conf/flutter_conf.dart';

class MaintPartCostWidget extends StatelessWidget {
  const MaintPartCostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const CustomText(data: 'Part + Cost'),
        const SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable:
              context.read<CarMaintPartCostBloc>().maintPartCostList,
          builder: (_, snapshot, __) {
            return Column(
              children: List.generate(snapshot.length, (index) {
                final partCost = snapshot[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: TextField(
                            onChanged: (value) {
                              partCost.partName = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Part name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: TextField(
                            onChanged: (value) {
                              partCost.partCost = double.parse(value);
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Part cost',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<CarMaintPartCostBloc>()
                                .removePartCost(index);
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CarMaintPartCostBloc>().addNewPartCostItem();
          },
          child: const Text('Add new part'),
        ),
      ],
    );
  }
}
