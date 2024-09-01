import 'package:flutter/material.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';

import '../../../../conf/flutter_conf.dart';

class MaintDateWidget extends StatelessWidget {
  const MaintDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final bloc = context.read<CarMaintBloc>();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomText(data: 'Maintenance dates details *'),
          SizedBox(
            height: 100,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: CustomText(
                            data: index == 0 ? 'Last date *' : 'Next date *',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (index == 1)
                          const Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Tooltip(
                              waitDuration: Duration.zero,
                              showDuration: Duration(seconds: 5),
                              message:
                                  "This date is the next maintenance date for the vehicle and should be after today's date by default is a day after the current date",
                              child: Icon(
                                Icons.info,
                                color: Colors.blueGrey,
                                size: 18,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: index == 1
                              ? DateTime.now().add(const Duration(days: 1))
                              : DateTime.now(),
                          firstDate: index == 1
                              ? DateTime.now().add(const Duration(days: 1))
                              : DateTime(2000),
                          lastDate: DateTime(2080),
                          builder: (context, child) => Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors.blueGrey,
                                onPrimary: Colors.white,
                                surface: Colors.white,
                                onSurface: Colors.black,
                              ),
                              dialogBackgroundColor: Colors.white,
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 17, 0),
                                ),
                              ),
                            ),
                            child: child!,
                          ),
                        ).then((value) {
                          if (value != null) {
                            final result = value.toString().split(' ')[0];
                            if (index == 0) {
                              bloc.maintDateController.value = result;
                            } else {
                              if (value.isBefore(DateTime.now())) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please select a date after today',
                                      ),
                                    ),
                                  );
                                }
                                return;
                              }
                              bloc.nextMaintDate.value = result;
                            }
                          }
                        });
                      },
                      child: Card(
                        margin: EdgeInsets.zero,
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 10),
                              ValueListenableBuilder(
                                valueListenable: index == 0
                                    ? bloc.maintDateController
                                    : bloc.nextMaintDate,
                                builder: (_, snapshot, __) {
                                  return Text(
                                    snapshot.isEmpty ? 'Select date' : snapshot,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
