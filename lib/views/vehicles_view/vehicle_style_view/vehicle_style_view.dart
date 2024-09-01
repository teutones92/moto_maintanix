import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model/car_category_model.dart';

class VehicleStyleView extends StatelessWidget {
  const VehicleStyleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: GridView.builder(
        itemCount: CarCategoryModel.list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          final car = CarCategoryModel.list[index];
          if (car.id < 0) {
            return const SizedBox.shrink();
          }
          return Card(
            child: InkWell(
              onTap: () {
                context.read<CarCategoryBloc>().setCategory(car, context);
                Navigator.pop(context);
              },
              child: Center(
                child: Stack(children: [
                  Text(
                    car.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(car.image),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
