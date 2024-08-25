import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/conf/navigator_x.dart';
import 'package:moto_maintanix/views/add_car_view/add_car.dart';
import 'package:moto_maintanix/views/home_view/widgets/category_tab_widget.dart';

import 'widgets/home_garage_list.dart';
import 'widgets/soonest_maint_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('MY GARAGE', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/logo/logo_white_transp.png'
                    : 'assets/logo/logo_dark_transp.png',
                width: 28),
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<HomeCarListControllerBloc, bool>(
        builder: (context, state) {
          return AnimatedSlide(
            offset: Offset(0, state ? 2 : 0),
            duration: const Duration(milliseconds: 300),
            child: FloatingActionButton.extended(
              onPressed: () =>
                  NavigatorX.push(context, const AddCar(vehicle: null)),
              backgroundColor: ThemeX.floatingButtonColor,
              label: SizedBox(
                width: size.width - 75,
                child: const Center(child: Text('Add Car')),
              ),
            ),
          );
        },
      ),
      body: const SafeArea(
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 13),
            //       child: Image.asset(
            //           Theme.of(context).brightness == Brightness.dark
            //               ? 'assets/logo/logo_white_transp.png'
            //               : 'assets/logo/logo_dark_transp.png',
            //           width: 28),
            //     ),
            //     Text('MY GARAGE',
            //         style: Theme.of(context).textTheme.titleLarge),
            //     IconButton(
            //       icon: const Icon(Icons.settings),
            //       onPressed: () {},
            //     )
            //   ],
            // ),
            // SizedBox(height: 10),
            SoonestMaintWidget(),
            Card(
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
            SizedBox(height: 10),
            CategoryTabWidget(),
            SizedBox(height: 15),
            HomeGarageList()
          ],
        ),
      ),
    );
  }
}
