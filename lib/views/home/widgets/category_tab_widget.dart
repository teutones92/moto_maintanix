import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/app/car_category_model.dart';

class CategoryTabWidget extends StatefulWidget {
  const CategoryTabWidget({super.key});

  @override
  State<CategoryTabWidget> createState() => _CategoryTabWidgetState();
}

class _CategoryTabWidgetState extends State<CategoryTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: CarCategoryModel.list.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      unselectedLabelColor: Colors.grey,
      dividerColor: Colors.transparent,
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      tabs: List.generate(
        CarCategoryModel.list.length,
        (index) {
          final category = CarCategoryModel.list[index];
          return Tab(
            child: Text(category.name),
          );
        },
      ),
    );
  }
}
