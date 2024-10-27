class EditItemDetailsViewModel {
  final int id;
  final int categoryId;
  final String detailsName;
  final int price;

  const EditItemDetailsViewModel(
      {required this.id,
        required this.categoryId,
        required this.detailsName,
        required this.price});

  factory EditItemDetailsViewModel.fromJson(
      {required Map<String, dynamic> json}) =>
      EditItemDetailsViewModel(
          id: json['id'],
          categoryId: json['categoryId'],
          detailsName: json['detailsName'],
          price: json['price']);
}
