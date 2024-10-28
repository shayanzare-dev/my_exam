class CategoryDto {
  final String categoryName;
  final double totalPrice;
  final List itemDetailsIds;

  CategoryDto({
    required this.categoryName,
    this.totalPrice = 0,
  }) : itemDetailsIds = [];

  Map<String, dynamic> toJson() => {
        'categoryName': categoryName,
        'totalPrice': totalPrice,
        'itemDetailsIds': itemDetailsIds
      };
}
