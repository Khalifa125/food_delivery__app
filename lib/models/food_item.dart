class FoodItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final bool isFavorite;
  final String categoryId;

  FoodItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
    required this.categoryId,
  });

  FoodItem copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
    bool? isFavorite,
    String? categoryId,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    id: 'Burger1',
    name: 'Beef Burger',
    imageUrl:
        'https://www.pngarts.com/files/3/Burger-PNG-Transparent-Image.png',
    price: 8.5,
    categoryId: '1',
  ),
  FoodItem(
    id: 'Burger2',
    name: 'Chicken Burger',
    imageUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 8.5,
    categoryId: '1',
  ),
  FoodItem(id: 'Burger3',
    name: 'Cheese Burger',
    imageUrl:
        'https://www.pngmart.com/files/16/Cheese-Burger-PNG-Transparent-Image.png',
    price: 8,
    categoryId: '1',
  ),
  FoodItem(id: 'Pizza1',
    name: 'Chicken Pizza',
    imageUrl: 'https://www.pngarts.com/files/3/Pizza-Download-PNG-Image.png',
    price: 9,
    categoryId: '2',
  ),
  FoodItem(id: 'pasta1',
    name: 'Pasta',
    imageUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    categoryId: '3',
  ),
  FoodItem(id: 'pasta2',
    name: 'Pasta2',
    imageUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    categoryId: '4',
  ),
  FoodItem(id: 'pasta3',
    name: 'Pasta3',
    imageUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    categoryId: '5',
  ),
  FoodItem(id: 'pasta4',
    name: 'Pasta4',
    imageUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    categoryId: '6',
  ),
];
