import 'package:dummy_bloc/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Bloc_Observer/bloc_observer.dart';
import 'Repository/product_repo.dart';
import 'bloc/productbloc_bloc.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
      MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => ProductsRepo()),
          ],
          child: const MyApp()
      )
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider(
          create: (context) => ProductblocBloc(ProductsRepo()),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

