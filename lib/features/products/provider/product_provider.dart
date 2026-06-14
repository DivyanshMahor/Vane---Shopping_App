import 'package:flutter_assignment/core/network/api_service.dart';
import 'package:flutter_assignment/features/products/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider =
    FutureProvider<List<ProductModel>>((ref) async{ //future me ayega data list form me productmdel me jayega
      return ApiService().getProducts(); // productList ayegi getpro se return krke
    });

