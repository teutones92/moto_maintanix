import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model.dart';
import 'package:moto_maintanix/models/external_server/cars_data_model/cars_data_model.dart';
import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_brand_view/vehicle_brand_view.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_model_view/vehicle_model_view.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_style_view/vehicle_style_view.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key, required this.vehicle});
  final CarTableModel? vehicle;

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  @override
  void initState() {
    if (widget.vehicle != null) {
      context.read<CarListItemBloc>().setDataFromDB(context, widget.vehicle!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Add Car'),
              background: Image.asset(
                'assets/cars_images/no_car.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        actions: List.generate(2, (index) {
                          return CupertinoActionSheetAction(
                            onPressed: () {
                              context.read<ImagePickerBloc>().pickImage(
                                    index == 0
                                        ? ImageSource.camera
                                        : ImageSource.gallery,
                                  );
                              Navigator.pop(context);
                            },
                            child: Text(index == 0 ? 'Camera' : 'Gallery'),
                          );
                        }),
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      );
                    }),
                icon: const Icon(Icons.camera_alt),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 4),
                            child: ElevatedButton(
                              onPressed: () {
                                switch (index) {
                                  case 0:
                                    showModalBottomSheet(
                                      context: context,
                                      // backgroundColor: Theme.of(context)
                                      //     .scaffoldBackgroundColor,
                                      builder: (context) {
                                        return const VehicleStyleView();
                                      },
                                    );
                                    break;
                                  case 1:
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      builder: (context) {
                                        return const VehicleBrandView();
                                      },
                                    );
                                    break;
                                  case 2:
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      builder: (context) {
                                        return const VehicleModelView();
                                      },
                                    );
                                    break;
                                }
                              },
                              child: Row(
                                children: [
                                  if (index == 0)
                                    BlocBuilder<CarCategoryBloc,
                                        CarCategoryModel?>(
                                      builder: (context, state) {
                                        return Text(state != null
                                            ? 'Vehicle style: ${state.name}'
                                            : 'Select the style of your car');
                                      },
                                    ),
                                  if (index == 1)
                                    BlocBuilder<VehicleBrandBloc,
                                        CarsDataModel?>(
                                      builder: (context, state) {
                                        return Text(state == null
                                            ? 'Select the brand of your car'
                                            : 'Vehicle brand: ${state.brand}');
                                      },
                                    ),
                                  if (index == 2)
                                    BlocBuilder<VehicleModelBloc, String>(
                                      builder: (context, state) {
                                        return Text(state.isEmpty
                                            ? 'Select the model of your car'
                                            : 'Vehicle model: $state');
                                      },
                                    ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: TextField(
                            controller:
                                context.read<CarListItemBloc>().carYearCtrl,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text('Enter the year of the car'),
                              icon: Icon(Icons.calendar_today_rounded),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: TextField(
                            controller: context
                                .read<CarListItemBloc>()
                                .carExtraNoteCtrl,
                            maxLines: 2,
                            decoration: const InputDecoration(
                              label: Text('Extra Notes'),
                              icon: Icon(Icons.note),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          if (widget.vehicle != null)
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Remove Vehicle'),
                                      content: const Text(
                                          'Are you sure you want to remove this vehicle?'),
                                      actions: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.green,
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.red,
                                          ),
                                          onPressed: () {
                                            context
                                                .read<CarListItemBloc>()
                                                .deleteVehicle(
                                                    context, widget.vehicle!);
                                          },
                                          child: const Text('Remove Vehicle'),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                child: const Text('Remove Vehicle'),
                              ),
                            ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                context
                                    .read<CarListItemBloc>()
                                    .saveCar(context);
                              },
                              child: Text(widget.vehicle != null
                                  ? 'Update Vehicle'
                                  : 'Save Vehicle'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
