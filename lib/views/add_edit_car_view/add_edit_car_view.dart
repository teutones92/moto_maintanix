import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/modals/0.1vehicle_brand_modal/modal_brand_view.dart';
import 'package:moto_maintanix/models/app/car_category_model/car_category_model.dart';
import 'package:moto_maintanix/models/external_server/cars_data_model/cars_data_model.dart';
import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/modals/0.2vehicle_model_modal/vehicle_model_modal.dart';
import 'package:moto_maintanix/modals/0.0vehicle_style_modal/vehicle_style_modal.dart';

import 'widgets/foot_buttons.dart';

class AddEditCar extends StatefulWidget {
  const AddEditCar({super.key, required this.vehicle});
  final CarTableModel? vehicle;

  @override
  State<AddEditCar> createState() => _AddEditCarState();
}

class _AddEditCarState extends State<AddEditCar> {
  late CarListItemBloc carListBLoc;
  @override
  void initState() {
    carListBLoc = context.read<CarListItemBloc>();
    if (widget.vehicle != null) {
      carListBLoc.setDataFromDB(context, widget.vehicle!);
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
            leading: IconButton(
              onPressed: () {
                carListBLoc.clearAll();
                carListBLoc.getCarList(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_arrow_left_rounded),
            ),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.vehicle != null ? 'Edit car' : 'Add Car'),
              background: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/cars_images/no_car.webp',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 50,
                    child: BlocBuilder<ImagePickerBloc, Uint8List?>(
                      bloc: context.read<ImagePickerBloc>(),
                      builder: (context, snapshot) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: snapshot != null && snapshot.isNotEmpty
                              ? Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 70,
                                      key: ValueKey(snapshot),
                                      backgroundImage: MemoryImage(
                                        snapshot,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.black.withOpacity(0.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2)),
                                          ],
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            context
                                                .read<ImagePickerBloc>()
                                                .reset();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(key: ValueKey('no_image')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        actions: List.generate(
                          2,
                          (index) {
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
                          },
                        ),
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
                                        return const VehicleStyleModal();
                                      },
                                    );
                                    break;
                                  case 1:
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      builder: (context) {
                                        return const ModalBrandView();
                                      },
                                    );
                                    break;
                                  case 2:
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      builder: (context) {
                                        return const VehicleModelModal();
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
                            controller: carListBLoc.carYearCtrl,
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
                      FootButtons(widget: widget),
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
