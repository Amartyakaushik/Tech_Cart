import 'package:tech_cart/models/catalogModel.dart';

class CartModel{
    // creating singleton class to encounter creation of new object(both in cart page and home page) each time when use try to add items to cart
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  CatalogModel? _catalog; // Catalog field
  final List<int> _itemIDs = []; // collection of IDs - stores ids of each item
  CatalogModel get catalog => _catalog!; // get catalog

  set catalog(CatalogModel newCatalog){ // set catalog
    assert(newCatalog != null);
    _catalog = newCatalog;

  }

  // List<Item?> get items => _itemIDs.map((id) => _catalog!.getById(id)).toList(); // Get items in the cart
  List<Item> get items {
    return _itemIDs.map((id) {
      return _catalog!.getById(id) ?? Item(
          id: 0,
          name: "Error",
          desc: "Item not found",
          price: 0,
          color: "#000000",
          image: "assets/images/keylogo.png"
      );
    }).toList();
  }

  num get totalPrice =>  // get Total price
      items.fold(0, (total, current) => total + current!.price);

  void add(Item item){ // add items to the list
    _itemIDs.add(item.id);
  }

  void remove(Item item){ // remove item from the list
    _itemIDs.remove(item.id);
  }
}