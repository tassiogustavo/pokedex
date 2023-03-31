class FavoriteModel {
  int? id;
  late String numRef;
  late String isFavorite;

  FavoriteModel({
    this.id,
    required this.numRef,
    required this.isFavorite,
  });

  FavoriteModel.fromMap(Map map) {
    id = map['_id'];
    numRef = map['num_ref'];
    isFavorite = map['is_favorite'];
  }
}
