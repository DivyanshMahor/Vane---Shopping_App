import 'package:dio/dio.dart';
import 'package:flutter_assignment/features/products/model/product_model.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    var response = await dio.get( // sending request for data || response store whole raw data
      "https://dummyjson.com/products",
    ); // all raw json data

    var productsJson = response.data["products"] as List ;  // only raw product data from response raw , json

    List<ProductModel> productModelList = productsJson.map((obj) {
      // json obj ko model me convert || map broker hai karwane ke liye convert
      return ProductModel.fromJson(obj); // THE OG CONVERTER
    }).toList(); //covert in list form
    return productModelList;
  }
}
