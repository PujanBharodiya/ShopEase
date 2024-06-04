class Category {
  int? id;
  String? title;
  String? description;
  int? date = DateTime.now().millisecondsSinceEpoch;

  Category({this.title, this.description});


  Category.withId({this.id, this.title, this.description, this.date});


  factory Category.fromMap(Map<dynamic, dynamic> map) {
    return Category.withId(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as int,
    );
  }
Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'date': this.date,
    };
  }


// convert object in to map


}
