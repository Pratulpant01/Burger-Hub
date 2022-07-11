// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String name;
  String categoryId;
  CategoryModel({
    required this.name,
    required this.categoryId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'categoryId': categoryId,
    };
  }

  @override
  String toString() => 'CategoryModel(name: $name, categoryId: $categoryId)';
}
