// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_legends_favorite/src/config/role_mobile_legends.dart';
import 'package:mobile_legends_favorite/src/controller/hero_controller.dart';
import 'package:mobile_legends_favorite/src/pages/list_hero_page.dart';

class GridButton extends StatelessWidget {
  final RoleHero? role;

  const GridButton({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (role == null) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          onTap: () {
            HeroControl.instance.getAllHero();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ListHeroPage(category: "All");
              },
            ));
          },
          child: const Center(
            child: Text(
              "All",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            color: role!.toColor(), borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          onTap: () {
            HeroControl.instance.groupByRole(role!.toRole());
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ListHeroPage(category: role!.roleName);
              },
            ));
          },
          child: Center(
            child: Text(
              role!.roleName,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
  }
}
