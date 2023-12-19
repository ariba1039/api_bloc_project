import 'package:api_bloc_project/models/products_model.dart';
import 'package:api_bloc_project/repo/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

//import 'package:http/http.dart' as http;

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductsRepo productsRepo;

  // super means sbh se upr

  ProductsBloc(this.productsRepo) : super(ProductsloadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      // implement event handler
      try {
        emit(ProductsloadingState());

        var data = await productsRepo.getProducts();

        emit(ProductsloadedState(data, productsModel: const []));
      } catch (e) {
        emit(ProductsErrorState(e.toString(), errormessage: ''));
      }
    });
  }
}
