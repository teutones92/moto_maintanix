import 'package:flutter/material.dart';

import '../../../conf/flutter_conf.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final bloc = context.read<CarListItemBloc>();
      return Card(
        elevation: 5,
        margin: const EdgeInsets.all(13),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: TextField(
            onSubmitted: (va) {
              bloc.onSearchVehicle(context, va);
            },
            decoration: const InputDecoration(
              hintText: 'Search for a car',
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
      );
    });
  }
}
