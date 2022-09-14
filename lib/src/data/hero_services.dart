import 'package:mobile_legends_favorite/src/config/mobile_legends_data.dart';
import 'package:mobile_legends_favorite/src/model/hero_model.dart';

class Services {
  Services._();

  static final instance = Services._();

  List<HeroModel> getAllHero() {
    final dataHero = heroData;
    return dataHero.map((e) => HeroModel.fromMap(e)).toList();
  }

  
}
