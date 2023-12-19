 import 'package:api_bloc_project/models/products_model.dart';
import 'package:http/http.dart' as http;
 
 class ProductsRepo{
   Future <List<ProductsModel>>getProducts()async{
     var response =
            await http.get(Uri.parse("https://fakestoreapi.com/products"));
        if (response.statusCode == 200) {
           return productsModelFromJson(response.body);
              // productsModel: const []));
        } else {
          throw Exception("Failed to load products");
        }
  }
 }