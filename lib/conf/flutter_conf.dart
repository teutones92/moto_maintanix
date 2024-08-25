import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_maintanix/blocs/car_maintenance_blocs/car_list_maint_bloc/car_list_maint_bloc.dart';
import 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_bloc/car_maint_bloc.dart';
import 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_files_bloc/car_maint_files_bloc.dart';
import 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_reminder_bloc/car_maint_reminder_bloc.dart';
import 'package:moto_maintanix/blocs/home_blocs/select_vehicle_bloc/select_vehicle_bloc.dart';
import 'package:moto_maintanix/blocs/home_blocs/soonest_maint_cubit/soonest_maint_cubit.dart';
import 'package:moto_maintanix/blocs/image_picker_bloc/image_picker_bloc.dart';
import 'package:moto_maintanix/blocs/vehicle_model_bloc/vehicle_model_bloc.dart';
import 'package:moto_maintanix/conf/extensions.dart';
import 'package:moto_maintanix/blocs/vehicle_brand_bloc/vehicle_brand_bloc.dart';
import 'package:moto_maintanix/blocs/car_list_item_bloc/car_list_item_bloc.dart';
import 'package:moto_maintanix/blocs/car_category_bloc/car_category_bloc.dart';
import 'package:moto_maintanix/blocs/home_blocs/home_car_list_controller_bloc/home_car_list_controller_bloc.dart';

import '../blocs/car_maintenance_blocs/car_maint_part_cost_bloc/car_maint_part_cost_bloc.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export './extensions.dart';
export 'package:moto_maintanix/blocs/vehicle_brand_bloc/vehicle_brand_bloc.dart';
export 'package:moto_maintanix/blocs/car_list_item_bloc/car_list_item_bloc.dart';
export 'package:moto_maintanix/blocs/car_category_bloc/car_category_bloc.dart';
export 'package:moto_maintanix/blocs/image_picker_bloc/image_picker_bloc.dart';
export 'package:moto_maintanix/blocs/vehicle_model_bloc/vehicle_model_bloc.dart';
export 'package:moto_maintanix/blocs/home_blocs/home_car_list_controller_bloc/home_car_list_controller_bloc.dart';
export 'package:moto_maintanix/blocs/car_maintenance_blocs/car_list_maint_bloc/car_list_maint_bloc.dart';
export 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_part_cost_bloc/car_maint_part_cost_bloc.dart';
export 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_bloc/car_maint_bloc.dart';
export 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_files_bloc/car_maint_files_bloc.dart';
export 'package:moto_maintanix/blocs/home_blocs/select_vehicle_bloc/select_vehicle_bloc.dart';
export 'package:moto_maintanix/blocs/home_blocs/soonest_maint_cubit/soonest_maint_cubit.dart';
export 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_reminder_bloc/car_maint_reminder_bloc.dart';

class CustomMultiBlocsProvider {
  static get providers => [
        BlocProvider(create: (_) => ThemeX()),
        BlocProvider(create: (_) => HomeCarListControllerBloc()),
        BlocProvider(create: (_) => SelectVehicleBloc()),
        BlocProvider(create: (_) => SoonestMaintCubit()),
        BlocProvider(create: (_) => VehicleBrandBloc()),
        BlocProvider(create: (_) => VehicleBrandListBloc()),
        BlocProvider(create: (_) => VehicleModelBloc()),
        BlocProvider(create: (_) => CarListItemBloc()),
        BlocProvider(create: (_) => CarCategoryBloc()),
        BlocProvider(create: (_) => ImagePickerBloc()),
        BlocProvider(create: (_) => CarListMaintBloc()),
        BlocProvider(create: (_) => CarMaintBloc()),
        BlocProvider(create: (_) => CarMaintPartCostBloc()),
        BlocProvider(create: (_) => CarMaintFilesBloc()),
        BlocProvider(create: (_) => CarMaintReminderBloc()),
      ];
}
