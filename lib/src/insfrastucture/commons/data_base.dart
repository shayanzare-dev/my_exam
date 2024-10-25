import '../../pages/category_page/models/category.dart';
import '../../pages/item_deatels_page/models/item_deatel.dart';

class DataBase {
  static List<Category> categories = <Category>[
    const Category(id: 1, categoryName: 'sussage'),
    const Category(id: 2, categoryName: 'banee'),
  ];

  static List<ItemDeatel> itemDeatel = <ItemDeatel>[
    ItemDeatel(id: 1, itemTitle: 'babaee', price: 10),
    ItemDeatel(id: 2, itemTitle: 'moxwzz', price: 10),
  ];
}
