import 'package:mobile_legends_favorite/src/model/hero_model.dart';

class FavoriteController {
  late List<HeroModel> heroId;

  FavoriteController._() {
    heroId = [];
  }

  static final instance = FavoriteController._();

  addFavorite(HeroModel model) {
    if (heroId.contains(model)) {
      return;
    }
    heroId = [...heroId, model];
  }

  removeFavorite(HeroModel model) {
    if (heroId.contains(model)) {
      heroId.remove(model);
    }
  }
}
