import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model.dart';
import 'package:moto_maintanix/models/repo/car_table/car_item_model.dart';

class HomeGarageList extends StatefulWidget {
  const HomeGarageList({super.key});

  @override
  State<HomeGarageList> createState() => _HomeGarageListState();
}

class _HomeGarageListState extends State<HomeGarageList> {
  @override
  void initState() {
    context.read<CarItemBloc>().getCarList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BlocBuilder<CarItemBloc, List<CarItemModel>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final item = state[index];
                final carCategory = CarCategoryModel.list
                    .where((element) => element.id == item.carType)
                    .first;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                  child: Card(
                    color: index == 0
                        ? const Color.fromARGB(122, 36, 0, 0)
                        : Colors.transparent,
                    elevation: index == 0 ? 5 : 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Text(
                                carCategory.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 8,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                carCategory.image,
                                width: 120,
                              ),
                            ],
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.brand!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(item.model!),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.edit_note,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
