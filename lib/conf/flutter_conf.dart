import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_maintanix/blocs/image_picker_bloc/image_picker_bloc.dart';
import 'package:moto_maintanix/blocs/vehicle_model_bloc/vehicle_model_bloc.dart';
import 'package:moto_maintanix/conf/extensions.dart';
import 'package:moto_maintanix/blocs/vehicle_brand_bloc/vehicle_brand_bloc.dart';
import 'package:moto_maintanix/blocs/car_item_bloc/car_item_bloc.dart';
import 'package:moto_maintanix/blocs/car_category_bloc/car_category_bloc.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export './extensions.dart';
export 'package:moto_maintanix/blocs/vehicle_brand_bloc/vehicle_brand_bloc.dart';
export 'package:moto_maintanix/blocs/car_item_bloc/car_item_bloc.dart';
export 'package:moto_maintanix/blocs/car_category_bloc/car_category_bloc.dart';
export 'package:moto_maintanix/blocs/image_picker_bloc/image_picker_bloc.dart';
export 'package:moto_maintanix/blocs/vehicle_model_bloc/vehicle_model_bloc.dart';

class CustomMultiBlocsProvider {
  static get providers => [
        BlocProvider(create: (_) => ThemeX()),
        BlocProvider(create: (_) => VehicleBrandBloc()),
        BlocProvider(create: (_) => VehicleBrandListBloc()),
        BlocProvider(create: (_) => VehicleModelBloc()),
        BlocProvider(create: (_) => CarItemBloc()),
        BlocProvider(create: (_) => CarCategoryBloc()),
        BlocProvider(create: (_) => ImagePickerBloc()),
      ];
}
