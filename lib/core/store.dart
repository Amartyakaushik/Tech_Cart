// import 'package:tech_cart/models/cartModel.dart';
// import 'package:tech_cart/models/catalogModel.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class MyStore extends VxStore {
//   CatalogModel catalog;
//   CartModel cart;
//
//   MyStore() {
//     catalog = CatalogModel();
//     cart = CartModel();
//     cart.catalog = catalog;
//   }
// }

import 'package:tech_cart/models/cartModel.dart';
import 'package:tech_cart/models/catalogModel.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatalogModel catalog;
  late CartModel cart;

  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}