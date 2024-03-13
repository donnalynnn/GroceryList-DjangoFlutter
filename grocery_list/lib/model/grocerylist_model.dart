// import 'dart:ffi';

class GroceryList {
  int id;
  String? product;
  bool isBought;

  GroceryList(this.id, this.product, this.isBought);
  factory GroceryList.fromJson(Map json) {
    return GroceryList(
      json["id"],
      json["body"],
      json["isBought"],

    );
  }

  Map<String, String> toJson() {
    return {
      "id": "$id",
      "body": "$product",
      "isBought": "$isBought",
    };
  }
}

// class Author {
//   int id;
//   String product;
//   Author(
//     this.id,
//     this.product,
//   );
//   factory Author.fromJson(Map json) {
//     return Author(
//       json["id"],
//       json["body"],
//     );
//   }
// }
