import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model.dart';
import 'package:moto_maintanix/models/repo/cars_data_model/cars_data_model.dart';
import 'package:moto_maintanix/views/car_style_view/car_style_view.dart';

class AddCar extends StatelessWidget {
  const AddCar({super.key});

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
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Add Car'),
              background: Image.asset(
                'assets/cars_images/no_car.png',
                fit: BoxFit.cover,
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
                                      builder: (context) {
                                        return const CarStyleView();
                                      },
                                    );
                                    break;
                                  case 1:
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const CarStyleView();
                                      },
                                    );
                                    break;
                                  case 2:
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const CarStyleView();
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
                                            : 'Select a style');
                                      },
                                    ),
                                  if (index == 1)
                                    BlocBuilder<VehicleBrandBloc,
                                        CarsDataModel?>(
                                      builder: (context, state) {
                                        return Text(state == null
                                            ? 'Select a brand'
                                            : 'Vehicle brand: ${state.brand}');
                                      },
                                    ),
                                  if (index == 2)
                                    BlocBuilder<VehicleModelBloc, String>(
                                      builder: (context, state) {
                                        return const Text('Vehicle model: ');
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
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13),
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text('Enter the year of the car'),
                              hintText: 'Eje: 2021',
                              icon: Icon(Icons.calendar_today_rounded),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {},
                        child: const Text('Save Car'),
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
