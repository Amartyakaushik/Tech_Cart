class CatalogModel{
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        descrption: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
        "https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/g/n/-original-imah28sqpattzfyp.jpeg?q=90&crop=false")
  ];
}

class Item {
  final int id;
  final String name;
  final String descrption;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.descrption, required this.price, required this.color, required this.image});
}