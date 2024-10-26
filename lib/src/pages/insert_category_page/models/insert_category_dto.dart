class InsertCategoryDto {
  final String categoryName;

  const InsertCategoryDto({required this.categoryName});

  Map<String, dynamic> toJson() => {'categoryName': categoryName};
}
