class DetailsViewModel {
  final int id;
  final int categoryId;
  final String detailsName;
  final int price;

  const DetailsViewModel(
      {required this.id,
      required this.categoryId,
      required this.detailsName,
      required this.price});

  factory DetailsViewModel.fromJson(
          {required Map<String, dynamic> json}) =>
      DetailsViewModel(
          id: json['id'],
          categoryId: json['categoryId'],
          detailsName: json['detailsName'],
          price: json['price']);
}
