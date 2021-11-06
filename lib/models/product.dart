class Product {
  int? id;
  String? brand;
  String? name;
  String? price;
  String? imageLink;
  String? productType;

  Product({this.id, this.brand, this.name, this.price, this.imageLink, this.productType});

  factory Product.fromJson(dynamic json) {
    return Product(
      id: json['id'],
      brand: json['brand'],
      name: json['name'],
      price: json['price'],
      imageLink: json['image_link'],
      productType: json['product_type']
    );
  }

}