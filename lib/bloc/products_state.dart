part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsloadingState extends ProductsState {}

final class ProductsloadedState extends ProductsState {
  final List<ProductsModel> productsModel;

  const ProductsloadedState({required this.productsModel});

  @override
  List<Object> get props => [productsModel];
}

final class ProductsErrorState extends ProductsState {
  final String errormessage;

  const ProductsErrorState(String string, {required this.errormessage});

  @override
  List<Object> get props => [errormessage];
}
