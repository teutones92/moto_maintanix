import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/repo/car_table/car_item_model.dart';

class CarItemBloc extends Cubit<List<CarItemModel>> {
  CarItemBloc() : super([]);

  void addCarItem(CarItemModel carItem) {
    state.add(carItem);
    emit(state);
  }

  void removeCarItem(CarItemModel carItem) {
    state.remove(carItem);
    emit(state);
  }

  void updateCarItem(CarItemModel carItem) {
    final index = state.indexWhere((element) => element.id == carItem.id);
    state[index] = carItem;
    emit(state);
  }
}
