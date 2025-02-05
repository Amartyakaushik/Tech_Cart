class CatalogModel{
  static List<Item>? items;
    // Item(
    //     id: 1,
    //     name: "iPhone 12 Pro",
    //     desc: "Apple iPhone 12th generation",
    //     price: 999,
    //     color: "#33505a",
    //     image:
    //     "https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/g/n/-original-imah28sqpattzfyp.jpeg?q=90&crop=false"
    // )

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