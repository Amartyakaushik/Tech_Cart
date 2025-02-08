class CatalogModel{
  static List<Item>? items;

  // method to get item by id
  Item? getById(int id) => items?.firstWhere((element) => element == id, orElse: null);
  // method to get item by position
  Item? getByPosition(int pos) => items?[pos];

  // creating singleton class to encounter creation of new object(both in cart page and home page) each time when use try to add items to cart
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
   factory Item.fromMap(Map<String, dynamic>map){
    return Item(
      id: map["id"],
      name:map["name"],
      desc: map["desc"],
      price : map["price"],
      color : map["color"],
      image : map["image"],
    );
  }

  toMap() =>{
     "id" : id,
    "name" : name,
    "desc" : desc,
    "price" : price,
    "color": color,
    "image" : image,
  };
}