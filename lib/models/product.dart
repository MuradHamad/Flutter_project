class Product {
  final int id;
  final String name;
  final String catagory;
  final String image;
  final double price;
  final String description;
  int quantity;
  List specs;

  Product({
    required this.id,
    required this.name,
    required this.catagory,
    required this.image,
    required this.price,
    required this.description,
    required this.quantity,
    required this.specs,
  });
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'catagory': catagory,
    'image': image,
    'price': price,
    'description': description,
    'quantity': quantity,
    'specs': specs,
  };
  static Product fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    catagory: json['catagory'],
    image: json['image'],
    price: json['price'],
    description: json['description'],
    quantity: json['quantity'],
    specs: json['specs'],
  );
}
