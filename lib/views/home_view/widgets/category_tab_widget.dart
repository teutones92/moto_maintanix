import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/app/car_category_model/car_category_model.dart';

class CategoryTabWidget extends StatefulWidget {
  const CategoryTabWidget({super.key});

  @override
  State<CategoryTabWidget> createState() => _CategoryTabWidgetState();
}

class _CategoryTabWidgetState extends State<CategoryTabWidget>
    with SingleTickerProviderStateMixin {
  List<CarCategoryModel> list = List.from(CarCategoryModel.list);
  @override
  void initState() {
    list.insert(0, CarCategoryModel(name: 'All', id: -1, image: ''));
    context.read<CarCategoryBloc>().tabController = TabController(
      length: list.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: context.read<CarCategoryBloc>().tabController,
      unselectedLabelColor: Colors.grey,
      dividerColor: Colors.transparent,
      padding: EdgeInsets.zero,
      onTap: (index) {
        context.read<CarCategoryBloc>().setCategory(list[index], context);
      },
      tabAlignment: TabAlignment.start,
      tabs: List.generate(
        list.length,
        (index) {
          final category = list[index];
          return Tab(
            child: Text(category.name),
          );
        },
      ),
    );
  }
}
