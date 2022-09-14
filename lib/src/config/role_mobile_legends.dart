// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:mobile_legends_favorite/src/model/hero_model.dart';

final roleMobileLegend = [
  {"role_id": 1, "role_name": "Marksman"},
  {"role_id": 2, "role_name": "Tank"},
  {"role_id": 3, "role_name": "Mage"},
  {"role_id": 4, "role_name": "Fighter"},
  {"role_id": 5, "role_name": "Assassin"},
  {"role_id": 6, "role_name": "Support"}
].map((e) => RoleHero.fromMap(e)).toList();

class RoleHero {
  final String roleName;
  RoleHero({
    required this.roleName,
  });

  Role toRole() {
    return roleName.roleValue()!;
  }

  Color toColor() {
    final role = toRole();
    switch (role) {
      case Role.marksman:
        return Colors.amberAccent.shade700;

      case Role.tank:
        return Colors.brown.shade400;
      case Role.mage:
        return Colors.blue.shade600;
      case Role.fighter:
        return Colors.red.shade800;
      case Role.asssasin:
        return Colors.purple.shade600;
      case Role.support:
        return Colors.cyan.shade300;
    }
  }

  factory RoleHero.fromMap(Map<String, dynamic> map) {
    return RoleHero(
      roleName: map['role_name'] as String,
    );
  }
}

enum Role {
  marksman("Marksman"),
  tank("Tank"),
  mage("Mage"),
  fighter("Fighter"),
  asssasin("Assassin"),
  support("Support");

  final String data;
  const Role(this.data);
}
