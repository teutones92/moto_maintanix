import 'package:flutter/material.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_cost_table/maint_cost_table.dart';

import '../../../../../conf/flutter_conf.dart';

class MaintPartCost extends StatelessWidget {
  const MaintPartCost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BlocBuilder<CarMaintPartCostBloc, List<MaintCostTable>>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CustomText(data: 'Part Cost'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final item = state[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(item.part),
                      Text(
                        "\$ ${item.cost.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.5)),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.attach_money),
                  Text('Total Cost'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '\$ ${state.fold<double>(0.0, (prev, element) => prev + element.cost).toString()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.5)),
            ],
          );
        },
      ),
    );
  }
}
