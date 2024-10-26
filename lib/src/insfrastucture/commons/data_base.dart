import '../../pages/category_page/models/category_view_model.dart';
import '../../pages/item_deatels_page/models/item_deatel.dart';

class DataBase {
  static List<CategoryViewModel> categories = <CategoryViewModel>[
    const CategoryViewModel(id: 1, categoryName: 'sussage', totalPrice: 0),
    const CategoryViewModel(id: 2, categoryName: 'banee', totalPrice: 0),
  ];

  static List<ItemDeatel> itemDeatel = <ItemDeatel>[
    ItemDeatel(id: 1, itemTitle: 'babaee', price: 10),
    ItemDeatel(id: 2, itemTitle: 'moxwzz', price: 10),
  ];
}
