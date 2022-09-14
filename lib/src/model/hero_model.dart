// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile_legends_favorite/src/config/role_mobile_legends.dart';
import 'package:mobile_legends_favorite/src/config/specialty_hero.dart';

class HeroModel {
  final int heroId;
  final String heroName;
  final String heroAvatar;
  final String heroRole;
  final String heroSpecially;
  HeroModel({
    required this.heroId,
    required this.heroName,
    required this.heroAvatar,
    required this.heroRole,
    required this.heroSpecially,
  });

  HeroModel copyWith({
    int? heroId,
    String? heroName,
    String? heroAvatar,
    String? heroRole,
    String? heroSpecially,
  }) {
    return HeroModel(
      heroId: heroId ?? this.heroId,
      heroName: heroName ?? this.heroName,
      heroAvatar: heroAvatar ?? this.heroAvatar,
      heroRole: heroRole ?? this.heroRole,
      heroSpecially: heroSpecially ?? this.heroSpecially,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hero_id': heroId,
      'hero_name': heroName,
      'hero_avatar': heroAvatar,
      'hero_role': heroRole,
      'hero_specially': heroSpecially,
    };
  }

  factory HeroModel.fromMap(Map<String, dynamic> map) {
    return HeroModel(
      heroId: map['hero_id'].toInt() as int,
      heroName: map['hero_name'] as String,
      heroAvatar: map['hero_avatar'] as String,
      heroRole: map['hero_role'] as String,
      heroSpecially: map['hero_specially'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroModel.fromJson(String source) =>
      HeroModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HeroModel(heroId: $heroId, heroName: $heroName, heroAvatar: $heroAvatar, heroRole: $heroRole, heroSpecially: $heroSpecially)';
  }

  @override
  bool operator ==(covariant HeroModel other) {
    if (identical(this, other)) return true;

    return other.heroId == heroId &&
        other.heroName == heroName &&
        other.heroAvatar == heroAvatar &&
        other.heroRole == heroRole &&
        other.heroSpecially == heroSpecially;
  }

  @override
  int get hashCode {
    return heroId.hashCode ^
        heroName.hashCode ^
        heroAvatar.hashCode ^
        heroRole.hashCode ^
        heroSpecially.hashCode;
  }
}

extension RoleHero on HeroModel {
  List<Role> toRole() {
    final data = heroRole.split(",");

    final role = data.map((e) {
      return e.roleValue();
    });

    List<Role> datas = [];
    for (var element in role) {
      if (element != null) {
        datas = [...datas, element];
      }
    }

    return datas;
  }
}

extension SpecialityHer on HeroModel {
  List<SpecialityHero> toSpeciality() {
    final data = heroSpecially.split(",");

    final role = data.map((e) {
      return e.specialityValue();
    });

    List<SpecialityHero> datas = [];
    for (var element in role) {
      if (element != null) {
        datas = [...datas, element];
      }
    }
    return datas;
  }
}

extension ToRole on String {
  Role? roleValue() {
    if (this == "Marksman") {
      return Role.marksman;
    } else if (this == "Tank") {
      return Role.tank;
    } else if (this == "Mage") {
      return Role.mage;
    } else if (this == "Fighter") {
      return Role.fighter;
    } else if (this == "Assassin") {
      return Role.asssasin;
    } else if (this == "Support") {
      return Role.support;
    } else {
      return null;
    }
  }
}

extension ToSpeciality on String {
  SpecialityHero? specialityValue() {
    if (this == "Initiator") {
      return SpecialityHero.initiator;
    } else if (this == "Push") {
      return SpecialityHero.push;
    } else if (this == "Regen") {
      return SpecialityHero.regen;
    } else if (this == "Charge") {
      return SpecialityHero.charge;
    } else if (this == "Damage") {
      return SpecialityHero.damage;
    } else if (this == "Crowd Control") {
      return SpecialityHero.crowdControl;
    } else if (this == "Poke") {
      return SpecialityHero.poke;
    } else if (this == "Reap") {
      return SpecialityHero.reap;
    } else if (this == "Burst Damage") {
      return SpecialityHero.burstDamage;
    } else if (this == "Burst") {
      return SpecialityHero.burst;
    } else if (this == "Cost") {
      return SpecialityHero.cost;
    } else {
      return null;
    }
  }
}
