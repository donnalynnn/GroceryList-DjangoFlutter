// ignore: camel_case_types
class GroceryList_static {
  String? id;
  String? product;
  bool isDone;

  GroceryList_static({
    required this.id,
    required this.product,
    this.isDone = false,
  });

  static List<GroceryList_static> groceryList() { // instead of these, get data from DB
    return [
      GroceryList_static(id: '01', product: 'Shin Ramen', isDone: true ),
      GroceryList_static(id: '02', product: 'Vegan Hotdogs', isDone: true ),
      GroceryList_static(id: '03', product: 'Onigiri', ),
      GroceryList_static(id: '04', product: 'Milk', ),
      GroceryList_static(id: '05', product: 'Minute Maid', ),
      GroceryList_static(id: '06', product: 'Bananas', ),
    ];
  }
}