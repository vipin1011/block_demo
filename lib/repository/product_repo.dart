
import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/product_models.dart';
class ProductsRepo{

 Future<List<ProductModels>> getProducts() async{
    Response response = await Dio().get("https://fakestoreapi.com/products");
    if (response.statusCode==200){
      return productModelsFromJson(jsonEncode(response.data));
    }
    else {
      throw Exception("Failed to load products");
    }
  }


}