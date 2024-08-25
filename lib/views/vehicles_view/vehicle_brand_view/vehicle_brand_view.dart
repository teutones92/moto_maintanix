import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/external_server/cars_data_model/cars_data_model.dart';

class VehicleBrandView extends StatefulWidget {
  const VehicleBrandView({super.key});

  @override
  State<VehicleBrandView> createState() => _VehicleBrandViewState();
}

class _VehicleBrandViewState extends State<VehicleBrandView> {
  @override
  void initState() {
    if (context.read<VehicleBrandListBloc>().state.isEmpty) {
      context.read<VehicleBrandListBloc>().getListOfBrand();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<VehicleBrandListBloc, List<CarsDataModel>>(
          builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: snapshot.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        onChanged: (value) {
                          context
                              .read<VehicleBrandListBloc>()
                              .searchBrand(value);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.grey,
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Text(snapshot[index].brand),
                                onTap: () {
                                  context
                                      .read<VehicleBrandBloc>()
                                      .setBrand(snapshot[index]);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const CircularProgressIndicator(),
        );
      }),
    );
  }
}
