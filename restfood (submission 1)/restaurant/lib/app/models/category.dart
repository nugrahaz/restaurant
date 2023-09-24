class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json['name'] as String,
      );
}
