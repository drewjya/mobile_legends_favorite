import 'package:flutter/material.dart';
import 'package:mobile_legends_favorite/src/config/role_mobile_legends.dart';
import 'package:mobile_legends_favorite/src/controller/hero_controller.dart';
import 'package:mobile_legends_favorite/src/pages/list_hero_page.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    Key? key,
    this.role,
  }) : super(key: key);
  final RoleHero? role;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Builder(builder: (context) {
        if (role == null) {
          return InkWell(
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
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
            onTap: () {
              HeroControl.instance.getAllHero();
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ListHeroPage(category: "All");
                },
              ));
            },
          );
        } else {
          return InkWell(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: role!.toColor(),
              ),
              height: 200,
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
            onTap: () {
              HeroControl.instance.groupByRole(role!.toRole());
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ListHeroPage(category: role!.roleName);
                },
              ));
            },
          );
        }
      }),
    );
  }
}
