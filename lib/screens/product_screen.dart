import 'package:api_bloc_project/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
      ),
      // body: BlocBuilder<ProductsBloc, ProductsState>(
      //   builder: (context, state) {
      //     if (state is ProductsloadingState) {
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     } else if (state is ProductsloadedState) {
      //       return ListView.builder(
      //           itemCount: state.productsModel.length,
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               leading:
      //                   Text(state.productsModel[index].category.toString()),
      //             );
      //           });
      //     } else if (state is ProductsErrorState) {
      //       return Center(
      //         child: Text(state.errormessage),
      //       );
      //     }
      //     return const SizedBox();
      //   },
      // ),
      // body: BlocListener<ProductsBloc, ProductsState>(
      //   listenWhen: (previous, current) => previous!= current,
      //   listener: (context, state) {
      //     //implement listener implementation here
      //     if (state is ProductsloadedState) {
      //       // also want to show the toast we will use velocity x using this pkg https://pub.dev/packages/velocity_x
      //       VxToast.show(context,
      //           msg: 'Velocity x products loaded successfully',
      //           position: VxToastPosition.center);
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(
      //           content: Text('Data Loaded'),
      //         ),
      //       );
      //     } else if (state is ProductsErrorState) {
      //       VxToast.show(context,
      //           msg: 'Velocity x products not loaded successfully',
      //           position: VxToastPosition.center);
      //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //           content: Text('Error Occured / data not loaded ')));
      //     }
      //   },
      //   child: const Center(
      //     child: Text(
      //       'Bloc Listener ',
      //       style: TextStyle(
      //         fontSize: 22,
      //       ),
      //     ),
      //   ),
      // ),
body : BlocConsumer<ProductsBloc, ProductsState>(
  // when we want to listen to only one state type we can use listenWhen
  // listenWhen: (previous, current) {
  //   if (current is ProductsloadedState) {
  //     return true;
  //   }
  //   return false;
  
  // },
  listener: (context, state) {
          //implement listener implementation here
          if (state is ProductsloadedState) {
            // also want to show the toast we will use velocity x using this pkg https://pub.dev/packages/velocity_x
            VxToast.show(context,
                msg: 'Velocity x products loaded successfully',
                position: VxToastPosition.center);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data Loaded'),
              ),
            );
          } else if (state is ProductsErrorState) {
            VxToast.show(context,
                msg: 'Velocity x products not loaded successfully',
                position: VxToastPosition.center);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Error Occured / data not loaded ')));
          }
        },
        // buildWhen: (previous, current) {
        //   if (current is ProductsloadedState) {
        //     return true;
        //   }
        //   return false;
        // },
   // when we want to build only one state type we can use buildWhen
   builder: (context, state) {
          if (state is ProductsloadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductsloadedState) {
            return ListView.builder(
                itemCount: state.productsModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Text(state.productsModel[index].category.toString()),
                  );
                });
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errormessage),
            );
          }
          return const SizedBox();
        },
)
    );
  }
}
