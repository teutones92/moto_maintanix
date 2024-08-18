import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/navigator_x.dart';
import 'package:moto_maintanix/views/add_car/add_car.dart';
import 'package:moto_maintanix/views/home/widgets/category_tab_widget.dart';

import 'widgets/home_garage_list.dart';
import 'widgets/soonest_maint_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => NavigatorX.push(context, const AddCar()),
        label: SizedBox(
          width: size.width - 75,
          child: const Center(child: Text('Add Car')),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Image.asset('assets/logo/logo_transp.png', width: 28),
                ),
                Text('MY GARAGE',
                    style: Theme.of(context).textTheme.titleLarge),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 10),
            const SoonestMaintWidget(),
            const Card(
              elevation: 5,
              margin: EdgeInsets.all(13),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a car',
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CategoryTabWidget(),
            const SizedBox(height: 15),
            const HomeGarageList()
          ],
        ),
      ),
    );
  }
}
