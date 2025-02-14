import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ict_final/features/home/cubit/home_states.dart';
import 'package:ict_final/features/home/data/models/product_data_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeLoadingState());

  Future<void> getProducts() async {
    emit(HomeLoadingState());
    try {
      List<ProductDataModel> products = [];

      final uri = Uri.parse('https://fakestoreapi.com/products');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> listOfData = json.decode(response.body);
        for (var map in listOfData) {
          ProductDataModel product = ProductDataModel.fromJson(map);
          products.add(product);
        }
        emit(HomeSuccessState(products));
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      emit(HomeErrorState(error.toString()));
    }
  }
}
