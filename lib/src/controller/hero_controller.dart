import 'package:collection/collection.dart';
import 'package:mobile_legends_favorite/src/config/role_mobile_legends.dart';
import 'package:mobile_legends_favorite/src/config/specialty_hero.dart';
import 'package:mobile_legends_favorite/src/data/hero_services.dart';
import 'package:mobile_legends_favorite/src/model/hero_model.dart';

enum SortBased { name, speciality }

class HeroControl {
  HeroControl._() {
    allHero = getAllHero();
  }

  late List<HeroModel> allHero;

  static final instance = HeroControl._();

  List<HeroModel> getAllHero() {
    final a = Services.instance.getAllHero();
    allHero = a;
    return a;
  }

  List<HeroModel> groupBySpeciality(SpecialityHero specialityHero) {
    final a = getAllHero().groupBySpeciality(specialityHero);
    allHero = a;
    return a;
  }

  List<HeroModel> groupByRole(Role roleHero) {
    final a = getAllHero().groupByRole(roleHero);
    allHero = a;

    return a;
  }
}

extension SortHero on List<HeroModel> {
  sortHeroBased() {
    sort((a, b) => a.heroName.compareTo(b.heroName));
  }

  List<HeroModel> groupByRole(Role roleHero) {
    final data = groupBy(
      this,
      (hero) {
        return hero.toRole().contains(roleHero);
      },
    );

    return data[true] ?? [];
  }

  List<HeroModel> groupBySpeciality(SpecialityHero roleHero) {
    final data = groupBy(
      this,
      (hero) {
        return hero.toSpeciality().contains(roleHero);
      },
    );

    return data[true] ?? [];
  }
}
