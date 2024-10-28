class CategoryViewModel {
  final int id;
  final List itemDetailsIds;
  final String categoryName;
  final double totalPrice;

  const CategoryViewModel(
      {required this.id,
      required this.categoryName,
      required this.totalPrice,
      required this.itemDetailsIds});

  factory CategoryViewModel.fromJson(
          {required final Map<String, dynamic> json}) =>
      CategoryViewModel(
          id: json['id'],
          categoryName: json['categoryName'],
          totalPrice: json['totalPrice'],
          itemDetailsIds: json['itemDetailsIds']);
}
