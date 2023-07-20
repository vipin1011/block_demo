
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../Repository/product_repo.dart';
import '../models/product_models.dart';

part 'productbloc_event.dart';
part 'productbloc_state.dart';

class ProductblocBloc extends Bloc<ProductLoadedEvent, ProductblocState> {
 final ProductsRepo productsRepo;
  ProductblocBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async {
      final dio = Dio();
      try{
        emit(ProductsLoadingState());
        final data = await productsRepo.getProducts();
        emit(ProductsLoadedState(data));


        
      }
      catch (e){
        emit(ProductsErrorState(e.toString()));

      }

    });
  }
}
