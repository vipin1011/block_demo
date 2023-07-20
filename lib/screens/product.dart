import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/productbloc_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

bool isResponseSaved = false;

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    if (!isResponseSaved) {
      context.read<ProductblocBloc>().add(ProductLoadedEvent());
      isResponseSaved = true;
    }
    super.initState();
  }

  @override

    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Data from Server"),
            backgroundColor: Colors.green,
          ),
          body: BlocBuilder<ProductblocBloc, ProductblocState>(
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if (state is ProductsLoadedState) {
                return ListView.builder(
                    itemCount: state.productModel.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                        elevation: 10,
                        child: Column(
                          children: [
                            Text(state.productModel[index].category.toString().toUpperCase(),
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            ListTile(
                              leading: Container(
                                height: 120.0,
                                width: 80.0,
                                child: Image.network(
                                    state.productModel[index].image??'',
                                  fit: BoxFit.fill,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if(loadingProgress == null){
                                      return child;
                                    }else{
                                      return Center(child: CircularProgressIndicator(color: Colors.green,));
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(child: Text('Error loading image'));
                                  },
                                ),
                              ),
                              title: Text(state.productModel[index].title.toString()),
                              subtitle: Text(state.productModel[index].description.toString()),
                              trailing: Text('Rs. ${state.productModel[index].price.toString()}'),

                            ),
                          ],
                        ),
                      );
                    });
              }
              else if (state is ProductsErrorState) {
                return Center(child: Text(state.errorMessage),);
              }
              return const SizedBox();
            },
          )

      );
    }
  }
