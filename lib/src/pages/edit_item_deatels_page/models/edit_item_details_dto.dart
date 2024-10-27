class EditItemDetailsDto{
  final String detailsName;
  final int categoryId;
  final int price;

  const EditItemDetailsDto(
      {required this.detailsName,
        required this.categoryId,
        required this.price});

  Map<String, dynamic> toJson() => {
    'detailsName': detailsName,
    'categoryId': categoryId,
    'price': price
  };
}