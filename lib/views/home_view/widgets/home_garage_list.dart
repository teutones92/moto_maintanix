import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/conf/navigator_x.dart';
import 'package:moto_maintanix/models/app/car_category_model.dart';
import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/views/add_car_view/add_car.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maintenance_view/vehicle_maintenance_view.dart';

class HomeGarageList extends StatefulWidget {
  const HomeGarageList({super.key});

  @override
  State<HomeGarageList> createState() => _HomeGarageListState();
}

class _HomeGarageListState extends State<HomeGarageList> {
  late HomeCarListControllerBloc homeCarListControllerBloc;

  @override
  void initState() {
    context.read<CarListItemBloc>().getCarList(context);
    homeCarListControllerBloc = context.read<HomeCarListControllerBloc>();
    homeCarListControllerBloc.controllerListener();
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
        child: BlocBuilder<CarListItemBloc, List<CarTableModel>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.car_repair,
                        size: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        'No cars or selected car style in the garage',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Tap the "Add Car" button to add a car',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.length,
              controller: homeCarListControllerBloc.carListController,
              itemBuilder: (context, index) {
                final car = state[index];
                final carCategory = CarCategoryModel.list
                    .where((element) => element.id == car.carType)
                    .first;
                return Padding(
                  padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: index == state.length - 1 ? 50 : 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: BlocBuilder<SelectVehicleBloc, int>(
                      builder: (context, selectedIndex) {
                        return InkWell(
                          onTap: () {
                            context
                                .read<SelectVehicleBloc>()
                                .selectVehicle(context, index, car.id!);
                          },
                          child: Card(
                            color: index == selectedIndex
                                ? const Color.fromARGB(122, 36, 0, 0)
                                : Colors.transparent,
                            elevation: index == 0 ? 8 : 1,
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
                                          fontSize: 20,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black,
                                              blurRadius: 8,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Image.asset(
                                          carCategory.image,
                                          width: 120,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: car.id!,
                                        transitionOnUserGestures: true,
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            car.brand,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 8,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          car.model,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            // fontSize: 20,
                                            // fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
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
                                        onPressed: () {
                                          NavigatorX.push(
                                              context, AddCar(vehicle: car));
                                        },
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
                                        onPressed: () => NavigatorX.push(
                                          context,
                                          VehicleMaintenanceView(
                                              carItemModel: car),
                                        ),
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
