import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/external_server/cars_data_model/cars_data_model.dart';

class ModalBrandView extends StatefulWidget {
  const ModalBrandView({super.key});

  @override
  State<ModalBrandView> createState() => _ModalBrandViewState();
}

class _ModalBrandViewState extends State<ModalBrandView> {
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
                      child: Card(
                        child: TextField(
                          onChanged: (value) {
                            context
                                .read<VehicleBrandListBloc>()
                                .searchBrand(value);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search vehicle brand...',
                            filled: true,
                            // fillColor: Colors.grey.,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
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
