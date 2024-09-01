import 'package:flutter/material.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';
import 'package:moto_maintanix/models/app/maint_types_models/maint_types_models.dart';

import '../../../../conf/flutter_conf.dart';

class MaintTypeWidget extends StatelessWidget {
  const MaintTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final carMainBLoc = context.read<CarMaintBloc>();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(data: 'Maintenance type *'),
          const SizedBox(height: 10),
          ValueListenableBuilder(
              valueListenable: carMainBLoc.swapTextFieldToWrap,
              builder: (__, maintTypeCtrl, _) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: maintTypeCtrl ? 60 : 150,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: !maintTypeCtrl
                        ? Align(
                            alignment: Alignment.topLeft,
                            key: ValueKey(maintTypeCtrl),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Wrap(
                                spacing: 8,
                                children: List.generate(
                                    MaintTypes.maintTypesList.length, (index) {
                                  final maintType =
                                      MaintTypes.maintTypesList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      if (maintType.name == 'Other') {
                                        carMainBLoc.swapTextFieldToWrap.value =
                                            true;
                                        carMainBLoc.maintTypeController.text =
                                            '';
                                      } else {
                                        carMainBLoc.maintTypeController.text =
                                            maintType.name;
                                      }
                                    },
                                    child: ValueListenableBuilder(
                                        valueListenable:
                                            carMainBLoc.maintTypeController,
                                        builder: (_, text, __) {
                                          return Card(
                                            elevation:
                                                maintType.name == text.text
                                                    ? 8
                                                    : 2,
                                            color: maintType.name == text.text
                                                ? const Color.fromARGB(
                                                    139, 255, 17, 0)
                                                : null,
                                            margin: const EdgeInsets.all(4),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(maintType.name),
                                            ),
                                          );
                                        }),
                                  );
                                }),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.topLeft,
                            key: ValueKey(maintTypeCtrl),
                            child: TextField(
                              controller: context
                                  .read<CarMaintBloc>()
                                  .maintTypeController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade400,
                                hintText: 'Enter maintenance type',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<CarMaintBloc>()
                                        .swapTextFieldToWrap
                                        .value = false;
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ),
                            ),
                          ),
                  ),
                );
              }),
        ],
      );
    });
  }
}
