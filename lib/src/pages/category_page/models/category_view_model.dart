class CategoryViewModel {
  final int id;
  final String categoryName;
  final double? totalPrice;

  const CategoryViewModel(
      {required this.id, required this.categoryName, required this.totalPrice});


  factory CategoryViewModel.fromJson(
      {required final Map<String, dynamic> json}) =>
      CategoryViewModel(
        id: json['id'],
        categoryName: json['categoryName'],
        totalPrice: json['totalPrice'],
      );
}

