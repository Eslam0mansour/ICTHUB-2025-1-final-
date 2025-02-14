import 'package:ict_final/features/home/data/models/product_data_model.dart';

abstract class HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<ProductDataModel> products;
  HomeSuccessState(this.products);
}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState(this.error);
}
