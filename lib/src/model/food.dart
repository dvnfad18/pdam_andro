enum FoodType { Semua, Rumah, Gedung, Kantor, Lapangan }

class Food {
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String description;
  double score;
  FoodType type;
  int voter;

  Food(
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.isFavorite,
    this.description,
    this.score,
    this.type,
    this.voter,
  );
}
