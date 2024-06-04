class Product{
  String? id;
  String title;
  String description;
  double mrp;
  int discount;
  int categoryId;
  String imagepath;
  int timespamp = DateTime.now().microsecondsSinceEpoch;

  Product({required this.title, required this.description, required this.mrp, required this.discount,
    required this.categoryId, required this.imagepath});


  Product.withId({this.id, required this.title, required this.description, required this.mrp, required this.discount,
    required this.categoryId, required this.imagepath, required this.timespamp});

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product.withId(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      mrp: double.parse(map['mrp'].toString()),
      discount: map['discount'] as int,
      categoryId: map['categoryId'] as int,
      imagepath: map['imagepath'] as String,
      timespamp: map['timespamp'] as int,
    );
  }
Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'mrp': this.mrp,
      'discount': this.discount,
      'categoryId': this.categoryId,
      'imagepath': this.imagepath,
      'timespamp': this.timespamp,
    };
  }

}